return {
  opt = {
    -- completeopt = "menuone,noinsert,noselect",
    -- wildmode = "longest:full,full",
    wildignorecase = true,

    clipboard = "", -- Don't save to system clipboard; use keymap
    confirm = true, -- Confirm quit on errors
    cmdheight = 1, -- Override cmdheight=0
    linebreak = true, -- Break at "natural" spot on wrap
    relativenumber = false, -- Override
    wrap = true, -- Wrap lines
    whichwrap = "b,s,<,>,[,]", -- Motions that will wrap to prev/next line
  },
  g = {
    mapleader = ",",
  },
}
