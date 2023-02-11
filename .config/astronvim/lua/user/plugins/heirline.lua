return {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require("core.utils.status")
      opts.statusline = {
          hl = { fg = "fg", bg = "bg" },
          status.component.mode { mode_text = {} },
          status.component.git_branch(),
          status.component.file_info(),
          status.component.git_diff(),
          status.component.diagnostics(),
          status.component.fill(),
          status.component.cmd_info(),
          status.component.fill(),
          status.component.lsp(),
          status.component.treesitter(),
          { provider = " %4l/%L:%-3c %3p%%" },
          status.component.mode { surround = { separator = "right" } },
      }
      return opts
    end,
}
