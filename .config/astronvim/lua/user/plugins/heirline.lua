return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astronvim.utils.status"
    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      status.component.mode { mode_text = {} },
      status.component.git_branch(),
      status.component.git_diff(),
      status.component.file_info(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp(),
      status.component.treesitter(),
      { provider = " %4l/%L:%-3c %3p%%" },
      status.component.mode { surround = { separator = "right" } },
    }
    opts.winbar[1][1] = status.component.separated_path {
      max_depth = 1,
      path_func = status.provider.filename { modify = ":.:h" },
    }
    opts.winbar[2] = {
      status.component.separated_path {
        max_depth = 1,
        path_func = status.provider.filename { modify = ":.:h" },
      },
      status.component.file_info { -- add file_info to breadcrumbs
        file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
        file_modified = false,
        file_read_only = false,
        hl = status.hl.get_attributes("winbar", true),
        surround = false,
        update = "BufEnter",
      },
      status.component.breadcrumbs {
        icon = { hl = true },
        hl = status.hl.get_attributes("winbar", true),
        prefix = true,
        padding = { left = 0 },
      },
    }

    return opts
  end,
}
