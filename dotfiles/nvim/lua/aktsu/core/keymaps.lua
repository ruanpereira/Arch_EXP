vim.g.mapleader = " "

local keymap = vim.keymap --for conciseness

keymap.set("i", "jk", "<ESC>") -- on insert mode, apertar jk é o msm que apertar ESC, ou seja saia do modo

keymap.set("n", "x", "_x") --on normal mode, pressing x does not take the caracter deleted to a register

-- window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>wt", "<cmd>:vsplit term://%:p:h//zsh<CR>", { desc = "Open a terminal split"})

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- plugin keymaps
  -- vim maximizer
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>", {desc = "Maximize/Restore" })   --restore amd maximize current window

  -- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {desc = "Toggle file-explorer tree" })    --open and close nvim-tree

  -- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {desc = "Search for a file on the current directory" }) -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", {desc = "Search for string on the current directory"} ) -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", {desc = "Search for a string under cursor or selection on the current directory as you type"} ) -- find string under cursor or selection in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {desc = "List open buffers in current instance" }) -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {desc = "List available help tags" }) -- list available help tags
keymap.set("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", {desc = "Live fuzzy search on current buffer" }) -- Live fuzzy search inside of the currently open buffer 

  -- sudo files
keymap.set("n", "<leader>sw", "<cmd>SudoWrite", {desc = "Write the file as sudo" })  -- write the live file as a sudo, no permission problems
keymap.set("n", "<leader>se", "<cmd>SudoEdit", {desc = "Edit the file as sudo"})     -- edit the live file as a sudo, no permission problems

  -- manager keymaps
keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = " [L]azy package manager" })
keymap.set("n", "<leader>m", "<cmd>:Mason<cr>", { desc = " [M]ason LSP manager" })
