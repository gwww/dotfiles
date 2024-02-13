local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or vim.loop.fs_stat(lazypath)) then
  vim.g.astronvim_first_install = true -- lets AstroNvim know that this is an initial installation
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

local lazy_loaded, lazy = pcall(require, "lazy") -- validate that lazy is available
if not lazy_loaded then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

---@type LazyConfig
lazy.setup({
  { "AstroNvim/AstroNvim", branch = "v4", import = "astronvim.plugins" }, -- TODO: change `branch="v4"` to `version="^4"` on release
  { "machakann/vim-sandwich", event = "User AstroFile" },

  { import = "plugins" }, -- import my plugins
}, {
  -- install = { colorscheme = { "astrodark", "habamax" } },
  lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json",
  performance = {
    rtp = {
      disabled_plugins = { "gzip", "matchit", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin" },
    },
  },
})
