return function(config)
  config[1] = {
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
    { provider = " %4l/%L:%-3c %3p%%" },
    astronvim.status.component.mode { surround = { separator = "right" } },
  }

  if vim.g.heirline_bufferline then -- TODO: remove if statement with v3 release
    config[3][2] = astronvim.status.heirline.make_buflist(astronvim.status.component.file_info {
      file_icon = { padding = { left = 1 } },
      unique_path = { hl = { fg = "winbarnc_fg" } },
      padding = { left = 1, right = 1 },
      hl = function(self)
        return {
          fg = self.is_active and "tab_fg" or "tab_inactive_fg",
          bold = self.is_active,
        }
      end,
      surround = false,
    })
  end

  return config
end
