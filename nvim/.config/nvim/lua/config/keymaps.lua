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

-- extra added
vim.keymap.set("n", "<leader>fs", function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Swiper-like search (buffer)" })

-- Image feh
vim.keymap.set("n", "<leader>i", function()
  local file = vim.fn.expand("%:p") -- FULL path (IMPORTANT)
  vim.fn.jobstart({ "feh", file }, { detach = true })
end, { desc = "Open image with feh" })

-- for jj exit on terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "jj", [[<C-\><C-n>]], { noremap = true, silent = true })

-- For searcing files
-- vim.keymap.set("n", "<leader>fF", function()
--   require("telescope.builtin").find_files({
--     cwd = require("lazyvim.util").root(),
--     hidden = true,
--     no_ignore = true,
--   })
-- end, { desc = "Find ALL files (global)" })

-- vim.keymap.set("n", "<leader>fF", function()
--   require("telescope.builtin").find_files({
--     cwd = require("lazyvim.util").root(),
--   })
-- end, { desc = "Find file from project root" })

-- FUZZY FIND
local builtin = require("telescope.builtin")
local fb = require("telescope").extensions.file_browser
local wk = require("which-key")

wk.add({
  {
    "<leader><space>",
    function()
      fb.file_browser({
        path = vim.fn.expand("%:p:h"), -- current file dir (IMPORTANT)
        select_buffer = true,
      })
    end,
    desc = "File Browser (current dir)",
  },
})
