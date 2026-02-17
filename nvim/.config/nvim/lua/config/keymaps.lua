-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

-- Map Ctrl+Backspace to delete previous word in insert mode (like Ctrl-w)
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })

-- Fallback for terminals that send Ctrl+H for Ctrl+Backspace
vim.keymap.set("i", "<C-H>", "<C-w>", { desc = "Delete previous word (fallback)" })

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ==========================
-- JJ FOR ESC
-- ==========================
-- vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
map("i", "jj", "<Esc>", opts)
-- map("n", "ff", function() vim.cmd.Ex() end, opts)
-- map("n", "ff", ":Ex<CR>", opts)
map("n", "<leader>j", ":e ", opts)
map("n", "<leader>J", ":Ex ", opts)
-- ==========================
-- Window Management (SPC-w)
-- ==========================
map("n", "<leader>ww", "<C-w>w", { desc = "Switch to next window" })
map("n", "<leader>wv", "<C-w>v", { desc = "Vertical split" })
map("n", "<leader>ws", "<C-w>s", { desc = "Horizontal split" })
map("n", "<leader>wc", "<C-w>c", { desc = "Close window" })

-- ==========================
-- Buffer Management (SPC-b)
-- ==========================
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bk", "<cmd>bdelete<CR>", { desc = "Kill/Close buffer" })

-- Help / Info (SPC-h)
-- ==========================
map("n", "<leader>hk", "<cmd>help<CR>", { desc = "Vim help" })
map("n", "<leader>hm", "<cmd>:messages<CR>", { desc = "Show messages" })
