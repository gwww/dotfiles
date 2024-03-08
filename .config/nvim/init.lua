-- bootstrap lazy.nvim, AstroNvim, and user plugins

local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or vim.loop.fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

local lazy_loaded, lazy = pcall(require, "lazy")
if not lazy_loaded then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

pcall(require, "pre-setup")

lazy.setup({
  { "AstroNvim/AstroNvim", branch = "v4", import = "astronvim.plugins" }, -- TODO: change `branch="v4"` to `version="^4"` on release
  { import = "plugins" }, -- import my plugins
}, {
  install = { colorscheme = { "nord", "catppuccin", "astrodark", "habamax" } },
  ui = { border = "rounded" },
  performance = {
    rtp = {
      disabled_plugins = { "gzip", "matchit", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin" },
    },
  },
})

pcall(require, "post-setup")
