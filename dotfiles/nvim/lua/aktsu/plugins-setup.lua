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
  -- { "github/copilot.vim"},
})
