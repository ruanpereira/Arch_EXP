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
  "nvim-tree/nvim-tree.lua", -- file explorer
  -- auto closing
  "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
  -- colorizer
  "norcalli/nvim-colorizer.lua", -- for showing hex colors on terminal
  -- { "github/copilot.vim"},
 
  -- snippets
  "L3MON4D3/LuaSnip", -- snippet engine
  "saadparwaiz1/cmp_luasnip", -- for autocompletion
  "rafamadriz/friendly-snippets", -- useful snippets
 
  --latex (ez config) 
  "evesdropper/luasnip-latex-snippets.nvim",
  "lervag/vimtex",

  -- autocompletion
  "hrsh7th/nvim-cmp", -- completion plugin
  "hrsh7th/cmp-buffer", -- source for text in buffer
  "hrsh7th/cmp-path", -- source for file system paths

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
    change_detection = {notify = false},
})
