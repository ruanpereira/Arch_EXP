local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then                                         --import telescope plugin safetly
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then                                               --import telescope actions safetly
  return
end

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
        ["<C-h>"] = "which_key",
      },
    },
  },
})

telescope.load_extension("fzf")


