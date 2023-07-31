-- Add your own plugins here or in other files in this directory!
-- plugin is a {}, or {plugin url. pluginspecs...,...,}
return {{"folke/tokyonight.nvim",
         lazy=false,
         priority=1000,
	 opts={},
        },
	{"neanias/everforest-nvim",
	 version = false,
	 lazy = false,
	 priority = 1000,
	},
	{"ellisonleao/gruvbox.nvim",
	lazy=false,
	priority=1000,
	},
	{"nvim-lualine/lualine.nvim"},
	-- Dashboard (when open vim)
	{'glepnir/dashboard-nvim',
	event = 'VimEnter',
	config = function()
		require('dashboard').setup {
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
	dependencies = { {'nvim-tree/nvim-web-devicons'} }
	},
	--{"goolord/alpha-nvim",
	--dependencies = {'nvim-tree/nvim-web-devicons'},
	--lazy= true,
	--event="VimEnter",
    --},

}
