local ruler = {
    provider = " %4l/%L:%-3c %3p%%",
}

return {
    {
        hl = { fg = "fg", bg = "bg" },
        astronvim.status.component.mode(),
        astronvim.status.component.git_branch(),
        astronvim.status.component.file_info(
        -- astronvim.is_available "bufferline.nvim" and { filetype = {}, filename = false, file_modified = false } or
        -- nil
        ),
        astronvim.status.component.git_diff(),
        astronvim.status.component.diagnostics(),
        astronvim.status.component.fill(),
        astronvim.status.component.cmd_info(),
        astronvim.status.component.fill(),
        astronvim.status.component.lsp(),
        astronvim.status.component.treesitter(),
        ruler,
        astronvim.status.component.mode { surround = { separator = "right" } },
    },
    {
        fallthrough = false,
        {
            condition = astronvim.status.condition.is_active,
            astronvim.status.component.breadcrumbs { hl = { fg = "winbar_fg", bg = "winbar_bg" } },
        },
        astronvim.status.component.file_info {
            unique_path = {},
            file_icon = { hl = false },
            hl = { fg = "winbarnc_fg", bg = "winbarnc_bg" },
            surround = false,
        },
    },
}
