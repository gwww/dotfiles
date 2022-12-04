local ruler = { provider = " %4l/%L:%-3c %3p%%" }

return {
    {
        hl = { fg = "fg", bg = "bg" },
        astronvim.status.component.mode { mode_text = {} },
        astronvim.status.component.git_branch(),
        astronvim.status.component.file_info(),
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
}
