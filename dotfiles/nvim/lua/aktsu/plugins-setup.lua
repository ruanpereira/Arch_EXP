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

require("lazy").setup({{
  "folke/tokyonight.nvim",       --tokyonight theme
  lazy = false,
  priority = 1000,
  opts = {},
  }, 
  "christoomey/vim-tmux-navigator",  --windows navigation and tmux integration    
  "szw/vim-maximizer",  --maximize and restore current window
  "numToStr/Comment.nvim", --better commenting
  "nvim-lua/plenary.nvim",  --lua functions for other plugins
  "nvim-tree/nvim-tree.lua", -- file explorer
  "kyazdani42/nvim-web-devicons", --pretty icons
  "nvim-lualine/lualine.nvim", -- status bar
  { "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup {
      theme = 'hyper',
			config = {
			  week_header = {
			      enable = true,
			      concat = "Shishiro Botan (獅白ぼたん)"
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
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
    },
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
  })
