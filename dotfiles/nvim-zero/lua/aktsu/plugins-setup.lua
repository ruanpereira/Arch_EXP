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
  { "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup {
      theme = 'hyper',
			config = {
			  week_header = {
			      enable = true,
			      concat = "Henya dayo! (へにゃです)"
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
          desc = ' Notes',
          group = 'DiagnosticHint',
          action = 'Neorg',
          key = 'a',
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
}
  })
