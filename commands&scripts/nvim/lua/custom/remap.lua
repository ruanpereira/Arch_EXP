-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- File navigation keymap
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "Go to [p]roject [v]iew"})
vim.keymap.set("n", "<leader>ec", "<cmd>:e ~/.config/nvim/init.lua<cr>", { desc = "   Open Configuration"})

-- Package manager keymaps
vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "[L]azy package manager" })


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


