-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("plugins.telescope_buffer")
require("plugins.cmp")
require("config.autopair")
require("plugins.tokyonight")
require("plugins.transparent")
-- require("plugins.neotree")

-- vim.opt.clipboard = "unnamedplus"

if vim.g.vscode then
  -- VSCode-specific clipboard handling
  vim.g.clipboard = {
    name = "vscode",
    copy = {
      ["+"] = "vscode-copy",
      ["*"] = "vscode-copy",
    },
    paste = {
      ["+"] = "vscode-paste",
      ["*"] = "vscode-paste",
    },
    cache_enabled = 0,
  }
  vim.opt.clipboard = "unnamedplus" -- now safe to enable
end

if vim.g.vscode then
  vim.keymap.set({ "n", "v" }, "y", '"+y', { desc = "Yank to system clipboard" })
  vim.keymap.set({ "n", "v" }, "Y", '"+Y', { desc = "Yank line to system clipboard" })
  vim.keymap.set("n", "p", '"+p', { desc = "Paste from system clipboard" })
end
