--- Plugins to support fuctionalities
return {{"tpope/vim-sleuth"},
        { -- Add indentation guides even on blank lines
         'lukas-reineke/indent-blankline.nvim',
          opts = {
                char = '┊',
                show_trailing_blankline_indent = false,
          },
         },
	{"folke/which-key.nvim", opts={}},
	  -- Fuzzy Finder (files, lsp, etc)
        {"nvim-telescope/telescope.nvim", 
	 branch = '0.1.x', 
	 dependencies = { "nvim-lua/plenary.nvim"} },
	{"nvim-telescope/telescope-fzf-native.nvim",
         build = 'make',
         cond = function()
              return vim.fn.executable 'make' == 1
         end,
        },
        {-- Highlight, edit, and navigate code
         'nvim-treesitter/nvim-treesitter',
         dependencies = {
             'nvim-treesitter/nvim-treesitter-textobjects',

         build = ':TSUpdate',
        },
        {"j-hui/fidget.nvim",
        opts = {},
        tag = "legacy"}, }

}
