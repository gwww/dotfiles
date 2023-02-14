return {
    opt = {
        -- completeopt = "menuone,noinsert,noselect",
        wildmode = "longest:full,full",
        wildignorecase = true,

        clipboard = "", -- Don't save to system clipboard; use keymap
        confirm = true, -- Confirm quit on errors
        cmdheight = 1, -- Override cmdheight=0
        linebreak = true, -- Break at "natural" spot on wrap
        relativenumber = false, -- Override
        sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
        showtabline = 0, -- Disable the tabline with the buffer list
        timeoutlen = 300,
        wrap = true, -- Wrap lines
        whichwrap = "b,s,<,>,[,]", -- Motions that will wrap to prev/next line
    },
    g = {
        mapleader = ",",
        terminal_color_0 = "#000000",
        terminal_color_1 = "#cc5555",
        terminal_color_2 = "#55cc55",
        terminal_color_3 = "#cdcd55",
        terminal_color_4 = "#5455cb",
        terminal_color_5 = "#cc55cc",
        terminal_color_6 = "#7acaca",
        terminal_color_7 = "#cccccc",
        terminal_color_8 = "#555555",
        terminal_color_9 = "#ff5555",
        terminal_color_10 = "#55ff55",
        terminal_color_11 = "#ffff55",
        terminal_color_12 = "#5555ff",
        terminal_color_13 = "#ff55ff",
        terminal_color_14 = "#55ffff",
        terminal_color_15 = "#ffffff",
    },
}
