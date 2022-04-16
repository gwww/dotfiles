local Color = require("nightfox.lib.color")

require("nightfox").setup({
    options = {
        styles = {
            comments = "italic",
        },
    },
    palettes = {
        nightfox = {
            -- bg1 = "#111720",
            bg1 = Color.from_hsl(216, 31, 7.5):to_css(),
            -- bg3 = "#1b2533",
            bg3 = Color.from_hsl(216, 31, 12):to_css(),
            comment = "#7687a0",
        },
    },
    groups = {},
})

vim.cmd("colorscheme nightfox")
