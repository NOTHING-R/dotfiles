-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#a6e3a1", bold = true })
-- vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#94e2d5", bold = true })
-- -- vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#1e1e2e" })
-- vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = "#f9e2af" })
-- vim.api.nvim_set_hl(0, "@text.title", { fg = "#a6adc8", bold = true })
-- vim.api.nvim_set_hl(0, "@text.literal", { fg = "#bac2de" })
-- vim.api.nvim_set_hl(0, "@markup.raw", { fg = "#cdd6f4" })
-- vim.api.nvim_set_hl(0, "@markup.heading", { fg = "#89b4fa", bold = true })
--
-- -- vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#1e2030" })
-- -- or a slightly transparent-ish dark tint matching your theme, e.g.:
--
-- vim.api.nvim_set_hl(0, "@markup.raw.block", { bg = "NONE" })
--
-- vim.api.nvim_set_hl(0, "@markup.heading", { fg = "#ffffff", bold = true })
-- vim.api.nvim_set_hl(0, "@markup.quote", { fg = "#6c6f85" })
-- vim.api.nvim_set_hl(0, "@markup.strong", { fg = "#d14d4d", bold = true })

vim.opt.termguicolors = true
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight NormalFloat guibg=none")
vim.g.root_spec = { "cwd" }

vim.g.inlay_hints_enabled = true

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

-- Extra added for directory
vim.opt.autochdir = false -- এটা off রাখাই better

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local buftype = vim.bo[buf].buftype
    local filetype = vim.bo[buf].filetype

    -- Skip special buffers (especially Oil)
    if buftype ~= "" or filetype == "oil" or vim.bo[buf].modifiable == false then
      return
    end

    -- Your original lcd logic here, but safer
    local dir = vim.fn.expand("%:p:h") -- or whatever you're using
    if vim.fn.isdirectory(dir) == 1 then
      pcall(vim.cmd, "lcd " .. vim.fn.fnameescape(dir))
    end
  end,
})

-- Old code

-- org mode specific for indent inside example block
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "org",
--   callback = function()
--     -- Wrap settings
--     vim.opt_local.wrap = true
--     vim.opt_local.linebreak = true
--
--     -- Smart indent for wrapped lines
--     vim.opt_local.breakindent = true
--     vim.opt_local.breakindentopt = "shift:2"
--
--     -- Make wrapped lines look clean
--     vim.opt_local.showbreak = " "
--     -- 👉 THIS fixes heading paragraph issue
--     vim.opt_local.indentexpr = " "
--     -- 🔥 IMPORTANT FIXES
--     vim.opt_local.autoindent = true
--     vim.opt_local.smartindent = false
--     vim.opt_local.cindent = false
--
--     -- 🧠 Org specific
--     vim.opt_local.formatoptions:remove({ "t" }) -- auto text wrap off
--     vim.opt_local.formatoptions:append({ "n" }) -- numbered list support
--   end,
-- })

--
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    -- vim.opt_local.breakindentopt = "shift:2"
    -- Make wrapped lines look clean
    vim.opt_local.showbreak = " "
    -- 👉 THIS fixes heading paragraph issue
    vim.opt_local.indentexpr = " "
  end,
})
