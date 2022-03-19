--
-- Install Packer if not installed
local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path})
    vim.fn.system({"rm", vim.fn.stdpath("config") .. "/plugin/packer_compiled.lua"})
    vim.cmd "packadd packer.nvim"
end

-- Automatically run :PackerCompile whenever plugins.lua is updated
require("au2").group("PackerGroup", function(grp)
    grp.BufWritePost = { "plugins.lua", "source <afile> | PackerCompile" }
end)

return require("packer").startup(function()
    use {
        {"nvim-telescope/telescope.nvim", config=function() require("plugins.telescope") end,
          requires="nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope-fzf-native.nvim", config=function() require("telescope").load_extension("fzf") end,
          run="make", after="telescope.nvim",
        },
        {"nvim-telescope/telescope-symbols.nvim", after="telescope.nvim"}
    }
    use  "ggandor/lightspeed.nvim"
    use  "gwww/vim-bbye"
    use {"kyazdani42/nvim-web-devicons", config=function() require("nvim-web-devicons").setup() end}
    -- Consider switching to native nvim filetype.lua
    -- https://neovim.discourse.group/t/introducing-filetype-lua-and-a-call-for-help/1806
    use  "nathom/filetype.nvim"
    use {"neovim/nvim-lspconfig", config=function() require("plugins.lsp-config") end}
    use {"numToStr/FTerm.nvim", config=function() require("plugins.fterm") end}
    use {"nvim-lualine/lualine.nvim", config=function() require("plugins.lualine") end}
    use {"nvim-treesitter/nvim-treesitter", config=function() require("plugins.treesitter") end, run=":TSUpdate"}
    use {"nvim-treesitter/nvim-treesitter-textobjects", after="nvim-treesitter"}
    use {"nvim-treesitter/nvim-treesitter-refactor", after="nvim-treesitter"}
    use {"TimUntersberger/neogit", requires="nvim-lua/plenary.nvim"}
    use  "tpope/vim-commentary"
    use  "tpope/vim-endwise"
    use  "tpope/vim-surround"
    use  "tpope/vim-repeat"
    use  "wbthomason/packer.nvim"
    use  "wellle/targets.vim"
    use {"windwp/nvim-autopairs", config=function() require("nvim-autopairs").setup {} end}
    use {"EdenEast/nightfox.nvim", config=function() require("plugins.nightfox") end}

    if packer_bootstrap then
        require("packer").sync()
        packer_bootstrap = nil
    end
end)
