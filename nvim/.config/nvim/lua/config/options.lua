-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.termguicolors = true
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight NormalFloat guibg=none")
vim.g.root_spec = { "cwd" }

-- For line warp
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:2"
vim.opt.showbreak = ""
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nv"

-- For hideing status bar
vim.opt.showtabline = 1
vim.opt.laststatus = 3

-- org mode specific for indent inside example block
vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    vim.opt_local.breakindentopt = "shift:2"
    vim.opt_local.showbreak = " "
  end,
})
-- Extra added for directory
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("MyRootLCD", { clear = true }),
  callback = function()
    if vim.bo.buftype ~= "" or vim.bo.filetype == "snacks_terminal" then
      return -- skip terminals, help, quickfix, etc.
    end
    -- your existing root/lcd logic here
  end,
})
