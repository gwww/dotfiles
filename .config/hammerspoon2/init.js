// ===== Modal (port of hs.hotkey.modal Lua) =====
class Modal {
  constructor() {
    this.keys = []
  }

  bind(mods, key, pressedfn, releasedfn) {
    const hk = hs.hotkey.bind(mods, key, pressedfn ?? (() => { }), releasedfn ?? (() => { }))
    if (hk) {
      hk.disable()
      this.keys.push(hk)
    }
    return this
  }

  enter() {
    this.keys.forEach(hk => hk.enable())
  }

  exit() {
    this.keys.forEach(hk => hk.disable())
  }

  delete() {
    this.keys.forEach(hk => hk.delete())
    this.keys = []
  }
}

// ===== Hyper =====
class Hyper {
  constructor(modalKey) {
    this.presses = 0
    this.pressHooks = []
    this.releaseHooks = []
    this.modal = new Modal()

    this.hyperHotkey = hs.hotkey.bind([], modalKey, () => {
      this.presses = 0
      this.modal.enter()
      this.pressHooks.forEach(hook => hook())
    }, () => {
      this.modal.exit()
      this.releaseHooks.forEach(hook => hook(this.presses))
    })
  }

  bind(bindings) {
    const list = Array.isArray(bindings) ? bindings : [bindings]
    list.forEach(binding => {
      const mods = binding.modifiers || []
      const action = () => {
        this.presses++
        binding.action()
      }
      this.modal.bind(mods, binding.key, action)
    })
    return this
  }

  addHook(press, release) {
    if (press) this.pressHooks.push(press)
    if (release) this.releaseHooks.push(release)
  }
}

// ===== Smart Launch =====
let savedState = { lastApp: "" }

function smartLaunch(bundleID, name) {
  if (savedState.lastApp !== bundleID) {
    savedState = { lastApp: bundleID }
  }

  const app = hs.application.matchingBundleID(bundleID)

  if (!app) {
    hs.ui.alert(`Launching ${name}`).font(HSFont.system(56)).padding(24).duration(2).show()
    hs.application.launchOrFocus(bundleID)
  } else {
    if (!savedState.windows) {
      const windows = app.allWindows.filter(w => w.isStandard)
      savedState.windows = windows
      const frontmost = hs.window.focusedWindow()
      savedState.index = frontmost ? windows.indexOf(frontmost) : -1
      if (savedState.index < 0) savedState.index = 0
    }

    if (savedState.windows.length === 0) {
      hs.application.launchOrFocus(bundleID)
    } else {
      const idx = savedState.index % savedState.windows.length
      hs.application.launchOrFocus(bundleID)
      savedState.windows[idx].raise()
      savedState.windows[idx].focus()
      savedState.index = idx + 1
    }
  }
}

// ===== Window Functions =====
function cycleCalls(fn, args) {
  let i = 0
  return () => {
    fn(args[i])
    i = (i + 1) % args.length
  }
}

function toGrid(rect) {
  const win = hs.window.focusedWindow()
  if (!win) return
  const screen = hs.screen.main()
  if (!screen) return
  const frame = screen.fullFrame
  if (!frame) return
  win.frame = new HSRect(
    Math.floor(rect[0] * frame.w + 0.5) + frame.x,
    Math.floor(rect[1] * frame.h + 0.5) + frame.y,
    Math.floor(rect[2] * frame.w + 0.5),
    Math.floor(rect[3] * frame.h + 0.5),
  )
}

const previousSizes = {}

function toggleMaximize() {
  const win = hs.window.focusedWindow()
  if (!win) return
  const id = win.id
  if (previousSizes[id] == null) {
    const frame = win.frame
    if (!frame) return
    previousSizes[id] = frame
    const screen = win.screen
    if (!screen) return
    const full = screen.fullFrame
    if (!full) return
    win.frame = new HSRect(full.x, full.y, full.w, full.h)
  } else {
    const prev = previousSizes[id]
    win.frame = new HSRect(prev.x, prev.y, prev.w, prev.h)
    delete previousSizes[id]
  }
}

function moveScreen(dir) {
  const win = hs.window.focusedWindow()
  if (!win) return
  const frame = win.frame
  if (!frame) return
  const cur = win.screen
  if (!cur) return
  const target = dir === "East" ? cur.toEast() : cur.toWest()
  if (!target) return
  const local = cur.absoluteToLocal({ x: frame.x, y: frame.y, w: frame.w, h: frame.h })
  if (!local) return
  const newFrame = target.localToAbsolute(local)
  if (!newFrame) return
  win.frame = newFrame
}

// ===== Caffeine =====
function caffeine() {
  const type = "display"
  const awake = hs.power.isSleepPrevented(type)
  // TODO: add/remove menubar icon; no API yet.
  if (awake) {
    hs.power.allowSleep(type)
    hs.ui.alert("Sleepy").font(HSFont.system(56)).padding(24).duration(2).show()
  } else {
    hs.power.preventSleep(type)
    hs.ui.alert("Staying AWAKE!").font(HSFont.system(56)).padding(24).duration(2).show()
  }
}

// ===== Setup =====
const hyper = new Hyper("F20")

hyper.bind([
  { key: "a", action: () => smartLaunch("com.binarynights.ForkLift", "ForkLift") },
  { key: "c", action: caffeine },
  { key: "f", action: () => smartLaunch("com.apple.finder", "Finder") },
  { key: "h", action: () => hs.task.shell("open ~", {}) },
  { key: "q", action: () => smartLaunch("app.zen-browser.zen", "Zen Browser") },
  { key: "r", action: () => hs.reload() },
  { key: "w", action: () => smartLaunch("com.mitchellh.ghostty", "Ghostty") },
  { key: "y", action: () => hs.console.open() },
  { key: "z", action: () => smartLaunch("us.zoom.xos", "Zoom") },

  // Window management — horizontal splits
  { key: "left", action: cycleCalls(toGrid, [[0, 0, 0.5, 1], [0, 0, 2 / 3, 1], [0, 0, 1 / 3, 1]]) },
  { key: "right", action: cycleCalls(toGrid, [[0.5, 0, 0.5, 1], [1 / 3, 0, 2 / 3, 1], [2 / 3, 0, 1 / 3, 1]]) },

  // Move window between screens
  { key: "left", modifiers: ["shift"], action: () => moveScreen("West") },
  { key: "right", modifiers: ["shift"], action: () => moveScreen("East") },

  // Top / bottom thirds
  { key: "up", action: () => toGrid([0, 0, 1, 0.3]) },
  { key: "down", action: () => toGrid([0, 0.7, 1, 0.3]) },

  // Toggle maximize
  { key: "space", action: toggleMaximize },
])

// Reset smartLaunch state on hyper release
hyper.addHook(undefined, () => {
  savedState = { lastApp: "" }
})

hs.notify.create({ title: "Hammerspoon", subtitle: "Configuration loaded", sound: false })?.send()
