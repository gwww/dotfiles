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
