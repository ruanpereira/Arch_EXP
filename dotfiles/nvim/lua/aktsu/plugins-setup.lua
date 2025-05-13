-- Lazy Package Manager install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- installing plugins
require("lazy").setup({

  { "folke/tokyonight.nvim",       --tokyonight theme
  lazy = false,
  priority = 1000,
  opts = {},
  },

  { "nvimdev/dashboard-nvim",    --dashboard on initialization
  event = "VimEnter",
  config = function()
    require("dashboard").setup {
      theme = 'hyper',
			config = {
			  week_header = {
			      enable = true,
			      concat = "GOOD MORNING MINTO! (ミント・ファントーム)"
			},
			footer = {},
			shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope find_files hidden=true<cr>',
          key = 'd',
        },
      },
    },
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  "nvim-lua/plenary.nvim",  --lua functions for other plugins
  "nvim-lualine/lualine.nvim", -- status bar
  "szw/vim-maximizer",  --maximize and restore current window
  "nvim-tree/nvim-tree.lua", -- file explorer

  -- fuzzy finding w/ telescope
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
  { "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder

   -- managing & installing lsp servers, linters & formatters
  "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
  "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  "neovim/nvim-lspconfig", -- easily configure language servers
  "hrsh7th/cmp-nvim-lsp", -- for autocompletion on lsp
  { "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },         --enhanced lsp uis 
      { "nvim-treesitter/nvim-treesitter" },
    },
  },

  -- autocompletion
  "hrsh7th/nvim-cmp", -- completion plugin
  "hrsh7th/cmp-buffer", -- source for text in buffer
  "hrsh7th/cmp-path", -- source for file system paths

  -- treesitter (syntax highlighting)
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  },  --to better highlight

  -- snippets
  "L3MON4D3/LuaSnip", -- snippet engine
  "saadparwaiz1/cmp_luasnip", -- for autocompletion
  "rafamadriz/friendly-snippets", -- useful snippets

    -- slime copy paste to target
  {"jpalardy/vim-slime",
        lazy=true,
        ft= "julia",
        config = function()
            vim.g.slime_target="kitty"
        end
  },

  -- git integration
  "lewis6991/gitsigns.nvim", -- show line modifications on left hand side

  "onsails/lspkind.nvim", -- vs-code like icons for autocompletion

  -- auto closing
  "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

  -- colorizer
  "norcalli/nvim-colorizer.lua", -- for showing hex colors on terminal

  -- for edit and save sudo files easy
  "tpope/vim-eunuch",{

  --latex (ez config) 
  "evesdropper/luasnip-latex-snippets.nvim",
  "lervag/vimtex",

  -- showing key combination
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

  })
