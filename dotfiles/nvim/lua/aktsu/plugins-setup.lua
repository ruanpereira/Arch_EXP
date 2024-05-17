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
  -- fuzzy finding w/ telescope
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
  { "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  },  --to better highlight
    -- autocompletion
  "hrsh7th/nvim-cmp", -- completion plugin
  "hrsh7th/cmp-buffer", -- source for text in buffer
  "hrsh7th/cmp-path", -- source for file system paths

    -- snippets
  "L3MON4D3/LuaSnip", -- snippet engine
  "saadparwaiz1/cmp_luasnip", -- for autocompletion
  "rafamadriz/friendly-snippets", -- useful snippets

   -- managing & installing lsp servers, linters & formatters
  "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
  "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  "neovim/nvim-lspconfig", -- easily configure language servers
  "hrsh7th/cmp-nvim-lsp", -- for autocompletion
  { "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },         --enhanced lsp uis 
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  "onsails/lspkind.nvim", -- vs-code like icons for autocompletion

  -- auto closing
  "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

  -- colorizer
  "norcalli/nvim-colorizer.lua", -- for showing hex colors on terminal

  -- git integration
  "lewis6991/gitsigns.nvim", -- show line modifications on left hand side

  --latex 
  "evesdropper/luasnip-latex-snippets.nvim",
  { "lervag/vimtex",
        init= function ()
            --- Vim Tex plugin config
            -- Compiler with latexmk pdflatex biber pdflatex2x
            -- If other methods are needed just run again after e.g. makeglossaries
            vim.g.vimtex_compiler_method = 'latexmk'
            vim.g.vimtex_parser_bib_backend = 'biber'
            vim.g.vimtex_compiler_silent = 0
            vim.g.vimtex_complete_enabled = 1
            vim.g.vimtex_fold_enabled = 0
            vim.g.vimtex_fold_bib_enabled = 1
            vim.opt.conceallevel = 2
            vim.g.vimtex_conceal_cites = 'icon'--'brackets'
            vim.g.vimtex_syntax_conceal = {
                accents = 1,
                ligatures = 1,
                cites = 1,
                fancy = 1,
                spacing = 0,
                greek = 1,
                math_bounds = 1,
                math_delimiters = 1,
                math_fracs = 1,
                math_super_sub = 1,
                math_symbols = 0,
                sections = 0,
                styles = 1,
            }
            -- Configure okular vim side
            vim.g.vimtex_view_general_viewer = 'okular'
            vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
            -- Okular side
            -- "Settings > Editor > Custom Text Editor"
            -- command: nvim --headless -c "VimtexInverseSearch %l '%f'"
            -- source: https://docs.kde.org/stable5/en/okular/okular/inverse_search.html 
            vim.g.vimtex_syntax_enabled = 0
        end
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
