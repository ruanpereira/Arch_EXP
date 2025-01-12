-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "bash",
    "bibtex",
    "c",
    "cpp",
    "csv",
    "dockerfile",
    "markdown",
    "markdown_inline",
    "latex",
    "llvm",
    "lua",
    "ninja",
    "python",
    "gitignore",
    "rust",
    "toml",
    "vim",
    "xml",
    "yaml",
  },
  -- auto install above language parsers
  auto_install = true,
})
