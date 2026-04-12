-- =========================
-- UI STATE
-- =========================
vim.g.ui_hidden = false

-- =========================
-- STATUSLINE TOGGLE (lualine-safe)
-- =========================
vim.keymap.set("n", "<leader>ts", function()
  vim.g.ui_hidden = not vim.g.ui_hidden

  if vim.g.ui_hidden then
    vim.opt.laststatus = 0
  else
    vim.opt.laststatus = 3
  end

  vim.cmd("redrawstatus")
end, { desc = "Toggle Statusline" })

-- =========================
-- BUFFERLINE TOGGLE (SAFE WAY)
-- =========================
vim.g.bufferline_hidden = false

vim.keymap.set("n", "<leader>tt", function()
  vim.g.bufferline_hidden = not vim.g.bufferline_hidden

  if vim.g.bufferline_hidden then
    vim.opt.showtabline = 0
    vim.cmd("redrawtabline")
  else
    vim.opt.showtabline = 2
    vim.cmd("redrawtabline")
  end
end, { desc = "Toggle Bufferline" })

-- =========================
-- ULTRA MINIMAL MODE
-- =========================
vim.g.ui_hidden = false

vim.keymap.set("n", "<leader>tu", function()
  vim.g.ui_hidden = not vim.g.ui_hidden

  if vim.g.ui_hidden then
    -- hide UI
    vim.opt.laststatus = 0
    vim.opt.showtabline = 0
  else
    -- restore UI
    vim.opt.laststatus = 3
    vim.opt.showtabline = 2
  end
end, { desc = "Toggle UI (Minimal Mode)" })
