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

globalThis.Modal = Modal
