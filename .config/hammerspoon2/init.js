// Docs: https://cmsj.github.io/Hammerspoon2/

require("lib/modal.js")
require("lib/alert.js")
require("lib/hyper.js")
require("lib/smart-launch.js")
require("lib/window.js")
require("lib/caffeine.js")

// ===== Setup =====
const hyper = new Hyper("F20")
const smartLaunch = new SmartLaunch()

hyper.bind([
  { key: "a", action: () => smartLaunch.launch("com.binarynights.ForkLift", "ForkLift") },
  { key: "c", action: caffeine },
  { key: "d", action: () => hs.docs.show() },
  { key: "f", action: () => smartLaunch.launch("com.apple.finder", "Finder") },
  { key: "h", action: () => hs.task.shell("open ~", {}) },
  // { key: "q", action: () => smartLaunch.launch("app.zen-browser.zen", "Zen Browser") },
  { key: "q", action: () => smartLaunch.launch("org.mozilla.firefox", "Firefox") },
  { key: "r", action: () => hs.reload() },
  { key: "w", action: () => smartLaunch.launch("com.mitchellh.ghostty", "Ghostty") },
  { key: "y", action: () => hs.openConsole() },
  { key: "z", action: () => smartLaunch.launch("us.zoom.xos", "Zoom") },

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
hyper.addHook(undefined, () => smartLaunch.reset())

hs.notify.create({ title: "Hammerspoon", subtitle: "Configuration loaded", sound: false })?.send()
