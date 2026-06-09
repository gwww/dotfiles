class SmartLaunch {
  constructor() {
    this.lastApp = ""
  }

  launch(bundleID, name) {
    if (this.lastApp !== bundleID) {
      this.windows = undefined
      this.lastApp = bundleID
    }

    const app = hs.application.matchingBundleID(bundleID)

    if (!app) {
      alert(`Launching ${name}`)
      hs.application.launchOrFocus(bundleID)
    } else {
      if (!this.windows) {
        const windows = app.allWindows.filter(w => w.isStandard)
        this.windows = windows
        const frontmost = hs.window.focusedWindow()
        this.index = frontmost ? windows.indexOf(frontmost) : -1
        if (this.index < 0) this.index = 0
      }

      if (this.windows.length === 0) {
        hs.application.launchOrFocus(bundleID)
      } else {
        const idx = this.index % this.windows.length
        hs.application.launchOrFocus(bundleID)
        this.windows[idx].raise()
        this.windows[idx].focus()
        this.index = idx + 1
      }
    }
  }

  reset() {
    this.lastApp = ""
    delete this.windows
    delete this.index
  }
}

globalThis.SmartLaunch = SmartLaunch
