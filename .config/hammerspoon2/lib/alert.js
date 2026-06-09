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

globalThis.alert = alert
