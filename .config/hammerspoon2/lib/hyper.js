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

globalThis.Hyper = Hyper
