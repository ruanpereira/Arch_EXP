-- Config alpha plugin

-- Enter Nvim message and menu
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

-- Function to read message from .txt file\
local function read_header_from_file(path)
    local lines = {}
    path = vim.fs.normalize(path)
    for line in io.lines(path) do
        table.insert(lines, line)
    end
    return lines
end

-- Function to generate footer message
local function genfooter()
  local plugin_stats = require("lazy").stats()
  -- local mstime = plugin_stats.statruptime
  local datetime = os.date("  %m-%d-%Y   %H:%M:%S")
  local version = vim.version()
  local nvim_version_info = "   version " .. version.major .. "." .. version.minor .. "." .. version.patch
  return datetime .. "   " .. plugin_stats.count .. " Plugins "
  -- .. "in ~" .. mstime .. "ms"
  .. nvim_version_info
end

-- Message file
local header = {
  type = 'text',
  val = read_header_from_file('$HOME/.config/nvim/lua/alpha/greeting.txt'),
  opts = {
    position = 'center',
  }
}

-- Options list / buttons
local buttons = {
  type = 'group',
  val = {
    {
      type = 'text',
      val = ' Quick Options',
      opts = {
        position = 'center'
      }
    },
    {
      type = 'padding',
    },
    -- Items here
    dashboard.button("<leader> n f",   "   New File", ":ene <BAR> startinsert <CR>"),
    dashboard.button("<leader>   ?",   "   Recently Opened Files", ":Telescope oldfiles <CR>"),
    dashboard.button("<leader>   l",   "   Lazy Plugin Manager"),
    dashboard.button("<leader>   m",   "   Mason LSP Manager"),
    dashboard.button("<leader> e c",   "   Edit Config. File", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("u know, right?", " 󰅗  Quit Neovim", ":qa<CR>"),
  },
  opts = {
    spacing = 1,
  },
}

local footer = {
  type = 'text',
  val = genfooter(),
  opts = {
    position = 'center'
  },
}

-- Compose greeting screen / setup layout
alpha.setup({
  layout = {
    {
      type = 'padding',
      val = 2,
    },
    header,
    {
      type = 'padding',
      val = 2,
    },
    footer,
    {
      type = 'padding',
      val = 2,
    },
    buttons,
    {
      type = 'padding',
      val = 1,
    },
    -- mru,
  },
})

