local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)

  local packer_compiled = vim.fn.stdpath('config')..'/plugin/packer_compiled.lua'
  vim.api.nvim_command('!rm -f '..packer_compiled)

  return vim.notify('Packer installed, restart nvim and run :PackerSync', vim.log.levels.ERROR)
end

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
require('au2').group('PackerGroup', function(grp)
    grp.BufWritePost = { 'plugins.lua', 'source <afile> | PackerCompile' }
end)

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- use {'lewis6991/impatient.nvim', config = function() require('impatient') end}

  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lsp-config') end,
  }
  use {
    'kyazdani42/nvim-web-devicons',
    config = function() require('nvim-web-devicons').setup() end,
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('plugins.lualine') end
  }
  use {
    {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function() require('plugins.treesitter') end,
    },
    {'nvim-treesitter/playground', after = 'nvim-treesitter'},
    {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'},
    {'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter'},
    {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'},
  }
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {'nvim-lua/plenary.nvim'},
      config = function() require('plugins.telescope') end
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      after = 'telescope.nvim',
      run = 'make',
      config = function() require('telescope').load_extension('fzf') end
    },
    {
      'nvim-telescope/telescope-symbols.nvim',
      after = 'telescope.nvim',
    }
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end
  }
  use {
      'numToStr/FTerm.nvim',
      config = function() require('plugins.fterm') end,
  }

  -- Consider switching to native nvim filetype.lua
  -- https://neovim.discourse.group/t/introducing-filetype-lua-and-a-call-for-help/1806
  use 'nathom/filetype.nvim'             -- Detect type of file

  use 'ConradIrwin/vim-bracketed-paste'  -- No more ':set paste!'
  use 'gwww/vim-bbye'                    -- Delete buffer leaving window structure
  -- use 'haya14busa/is.vim'                -- Incremental search improvments
  use 'tpope/vim-commentary'             -- Toggle comments: <visual>gc, gc<motion>
  use 'tpope/vim-endwise'                -- Auto close begin, do, ...
  use 'tpope/vim-surround'               -- Add surround text objects e.g.: cs])
  use 'tpope/vim-repeat'                 -- Better '.' handling when repeated
  use 'ap/vim-css-color'
  use 'wellle/targets.vim'

  use {
    'EdenEast/nightfox.nvim',
    tag = "v1.0.0",
    config = function() require('plugins.nightfox') end
  }
end)
