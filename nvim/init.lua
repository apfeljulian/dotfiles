-- https://github.com/hendrikmi/dotfiles/blob/main/nvim
require("core.options")
require("core.keymaps")
require("core.autocommands")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local plugins = {}
local opts = {}

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {} },
    -- require("plugins.colorscheme"),
    -- require 'plugins.neotree',
  },
  checker = { enabled = true },
  install = { colorscheme = { "nord" } },
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme catppuccin]])

-- Function to check if a file exists
-- local function file_exists(file)
--   local f = io.open(file, 'r')
--   if f then
--     f:close()
--     return true
--   else
--     return false
--   end
-- end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
