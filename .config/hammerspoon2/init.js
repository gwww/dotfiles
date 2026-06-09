const configDir = hs.fs.homeDirectory() + "/.config/hammerspoon2/"
eval(hs.fs.read(configDir + "lib/modal.js"))

// ===== Alert Manager (stacks multiple alerts vertically) =====
const alert = (() => {
  const active = []
  const spacing = 90

  return (message) => {
    const screen = hs.screen.main()
    const f = screen.fullFrame
    const cx = f.x + f.w / 2
    const baseY = f.y + f.h * 2 / 3
    const y = baseY - active.length * spacing

    const w = 520
    const h = 80

    const win = hs.ui.window({
      x: Math.round(cx - w / 2),
      y: Math.round(y - h / 2),
      w, h,
    })
      .zstack()
      .rectangle()
      .fill("#2C3E50")
      .cornerRadius(16)
      .frame({ w: "100%", h: "100%" })
      .text(message)
      .font(HSFont.system(56))
      .foregroundColor("#FFFFFF")
      .end()
      .show()

    const entry = { win }
    active.push(entry)

    hs.timer.doAfter(2, () => {
      const idx = active.indexOf(entry)
      if (idx !== -1) active.splice(idx, 1)
      win.close()
    })

    return win
  }
})()

eval(hs.fs.read(configDir + "lib/hyper.js"))

// ===== Smart Launch =====
let savedState = { lastApp: "" }

function smartLaunch(bundleID, name) {
  if (savedState.lastApp !== bundleID) {
    savedState = { lastApp: bundleID }
  }

  const app = hs.application.matchingBundleID(bundleID)

  if (!app) {
    alert(`Launching ${name}`)
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
    alert("Sleepy")
  } else {
    hs.power.preventSleep(type)
    alert("Staying AWAKE!")
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
