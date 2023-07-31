--- Plugins that add IDE-like functionalities to nvim
return {
	{"numToStr/Comment.nvim", opts = {}}, -- Comments gc
	{-- LSP Configuration & Plugins
	'neovim/nvim-lspconfig',
	dependencies = {-- Automatically install LSPs to stdpath for neovim
		{ 'williamboman/mason.nvim', config = true },
		'williamboman/mason-lspconfig.nvim',
		-- Additional lua configuration, makes nvim stuff amazing!
		'folke/neodev.nvim',
	},
	},
	{-- Autocompletion
	'hrsh7th/nvim-cmp',
	dependencies = {-- Snippet Engine & its associated nvim-cmp source
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',

	-- Adds LSP completion capabilities
	'hrsh7th/cmp-nvim-lsp',

	-- Adds a number of user-friendly snippets
	'rafamadriz/friendly-snippets',
	},
	},
}
