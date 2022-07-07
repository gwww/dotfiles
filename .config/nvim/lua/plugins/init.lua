-- Install Packer if not installed
local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    packer_bootstrap = vim.fn.execute(
        "!git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. packer_path
    )
    vim.fn.system({ "rm", vim.fn.stdpath("config") .. "/plugin/packer_compiled.lua" })
    vim.cmd("packadd packer.nvim")
end

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("Packer", { clear = false }),
    pattern = "*/nvim/lua/plugins/init.lua",
    command = "source <afile> | PackerCompile",
})

return require("packer").startup({
    function(use)
        use("lewis6991/impatient.nvim")
        use("wbthomason/packer.nvim")

        -- Syntax parsing
        use({
            "nvim-treesitter/nvim-treesitter",
            config = function() require("plugins.treesitter") end,
            run = ":TSUpdate",
        })
        use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })
        use({ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" })
        use({ "nvim-treesitter/playground", after = "nvim-treesitter" })

        -- Telescope
        use({
            "nvim-telescope/telescope.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function() require("plugins.telescope") end,
        })
        use({
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
            after = "telescope.nvim",
            config = function() require("telescope").load_extension("fzf") end,
        })
        use({ "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" })
        use({ "RRethy/nvim-treesitter-endwise" })

        -- Language server
        use({
            "neovim/nvim-lspconfig",
            config = function() require("plugins.lsp-config") end,
        })

        use({
            "jose-elias-alvarez/null-ls.nvim",
            config = function() require("plugins.null-ls") end,
        })

        -- Colourscheme
        use({
            "EdenEast/nightfox.nvim",
            config = function() require("plugins.nightfox") end,
        })

        -- Auto generate pairs
        use({
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup({}) end,
        })

        -- Better s/f/t commands
        use({ "ggandor/lightspeed.nvim" })

        -- Developer Icons
        use({
            "kyazdani42/nvim-web-devicons",
            config = function() require("nvim-web-devicons").setup() end,
        })

        -- Floating Terminal
        use({
            "numToStr/FTerm.nvim",
            config = function() require("plugins.fterm") end,
        })

        -- Status and Tab lines
        use({
            "nvim-lualine/lualine.nvim",
            config = function() require("plugins.lualine") end,
        })

        -- Add/remove comments
        use({
            "numToStr/Comment.nvim",
            config = function() require("Comment").setup() end,
        })

        use({
            "luukvbaal/nnn.nvim",
            config = function() require("nnn").setup() end,
        })

        -- Good ole vim plugins
        use({ "gwww/vim-bbye" })
        use({ "tpope/vim-surround" })
        use({ "tpope/vim-repeat" })
        use({ "tpope/vim-unimpaired" })

        if packer_bootstrap then require("packer").sync() end
    end,
})
