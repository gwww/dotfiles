require("nightfox").setup({
    options = {
        styles = {
            comments = "italic",
            -- keywords = "bold",
            -- functions = "italic,bold",
        },
    },
    pallettes = {
        nightfox = {
            bg1 = "#111720",
            bg3 = "#1b2533",
            comment = "#7687a0",
        },
    },
    groups = {},
})

vim.cmd("colorscheme nightfox")
