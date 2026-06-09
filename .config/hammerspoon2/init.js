const configDir = hs.fs.homeDirectory() + "/.config/hammerspoon2/"
eval(hs.fs.read(configDir + "lib/modal.js"))

eval(hs.fs.read(configDir + "lib/alert.js"))

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

eval(hs.fs.read(configDir + "lib/window.js"))

eval(hs.fs.read(configDir + "lib/caffeine.js"))

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
