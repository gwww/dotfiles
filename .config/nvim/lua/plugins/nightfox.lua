local Color = require("nightfox.lib.color")

require("nightfox").setup({
    options = {
        styles = {
            comments = "italic",
        },
    },
    palettes = {
        nightfox = {
            bg1 = Color.from_hsl(216, 31, 8):to_css(),
            bg3 = Color.from_hsl(216, 31, 12):to_css(),
            comment = "#7687a0",
        },
    },
    groups = {
        nightfox = {
            DiffText = { bg = "darkgreen" },
        }
    },
})

vim.cmd("colorscheme nightfox")
