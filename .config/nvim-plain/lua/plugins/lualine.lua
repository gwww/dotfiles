require("lualine").setup({
    options = {
        theme = "jellybeans",
        icons_enabled = false,
        globalstatus = true,
    },
    sections = {
        lualine_y = {
            function() return [[%3p%%]] end,
        },
        lualine_z = {
            function() return [[%4l/%L:%-3c]] end,
        },
    },
    tabline = {
        lualine_a = {
            { "buffers", show_filename_only = false },
        },
    },
})
