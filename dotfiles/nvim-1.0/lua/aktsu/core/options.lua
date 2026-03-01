local opt = vim.opt -- for conciseness (pra ser simples)

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4     -- change the numbers to increase the space of the tabs
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") --use the system clipboard to copy something on neovim, basically nvim -> outside.

-- "-" fixing
opt.iskeyword:append("-")

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
