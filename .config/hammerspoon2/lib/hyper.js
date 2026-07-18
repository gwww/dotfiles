class Hyper {
  constructor(modalKey) {
    this.presses = 0
    this.pressHooks = []
    this.releaseHooks = []
    this._actions = []

    this.modalPressed = () => {
      this.presses = 0
      this.modal.enter()
      this.pressHooks.forEach(hook => hook())
    }
    this.modalReleased = () => {
      this.modal.exit()
      this.releaseHooks.forEach(hook => hook(this.presses))
    }

    this.modal = hs.hotkey.createModal([], '')
    this._modalKey = hs.hotkey.bind([], modalKey, this.modalPressed, this.modalReleased)
  }

  bind(bindings) {
    const list = Array.isArray(bindings) ? bindings : [bindings]
    list.forEach(binding => {
      const mods = binding.modifiers || []
      const fn = () => {
        this.presses++
        binding.action()
      }
      this._actions.push(fn) // Prevents GC
      this.modal.bind(mods, binding.key, fn, null)
    })
    return this
  }

  addHook(press, release) {
    if (press) this.pressHooks.push(press)
    if (release) this.releaseHooks.push(release)
  }
}

globalThis.Hyper = Hyper
