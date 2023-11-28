local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings for nvim-tree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})
