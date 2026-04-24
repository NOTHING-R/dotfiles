-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("plugins.telescope_buffer")
require("plugins.cmp")
require("config.autopair")
require("plugins.tokyonight")
require("plugins.transparent")
require("config.toggles")
require("config.neotree")
require("config.orgextra")
require("plugins.orgmode")
-- require("config.hightlights")

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "silent! write",
})

vim.api.nvim_set_hl(0, "RenderMarkdownCodeBlock", {
  bg = "NONE",
})

vim.api.nvim_set_hl(0, "RenderMarkdownCodeBlock", {
  link = "RenderMarkdownH1",
})

vim.api.nvim_set_hl(0, "RenderMarkdownCode", {
  bg = "#1e1e2e", -- subtle dark tone (optional)
})

vim.api.nvim_set_hl(0, "CursorLine", {
  bg = "#1f1f1f",
})

vim.api.nvim_set_hl(0, "CursorLineNr", {
  fg = "#aaaaaa",
})

-- For disableing speelcheck on md files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = false
  end,
})
