vim.o.hlsearch = false -- Set highlight on search
vim.wo.number = true -- Make line numbers default
vim.o.mouse = 'a' -- Enable mouse mode
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.o.breakindent = true -- Enable break indent
vim.o.undofile = true -- Save undo history
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true -- smart case
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.backup = false -- creates a backup file
vim.o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
vim.o.whichwrap = 'bs<>[]hl' -- which "horizontal" keys are allowed to travel to prev/next line
vim.o.wrap = false -- display lines as one long line
vim.o.linebreak = true -- companion to wrap don't split words
vim.o.scrolloff = 4 -- minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false`
vim.o.relativenumber = true -- set relative numbered lines
vim.o.numberwidth = 4 -- set number column width to 2 {default 4}
vim.o.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.o.tabstop = 4 -- insert n spaces for a tab
vim.o.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations
vim.o.expandtab = true -- convert tabs to spaces
vim.o.cursorline = false -- highlight the current line
vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window
vim.o.swapfile = false -- creates a swapfile
vim.o.smartindent = true -- make indenting smarter again
vim.o.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.o.showtabline = 2 -- always show tabs
vim.o.backspace = 'indent,eol,start' -- allow backspace on
vim.o.pumheight = 10 -- pop up menu height
vim.o.conceallevel = 0 -- so that `` is visible in markdown files
vim.o.fileencoding = 'utf-8' -- the encoding written to a file
vim.o.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.o.autoindent = true -- copy indent from current line when starting new one
vim.opt.shortmess:append 'c' -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append '-' -- hyphenated words recognized by searches
vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- separate vim plugins from neovim in case vim still in use


-- ===============================
-- Neovim Options (options.lua)
-- ===============================

local opt = vim.opt

-- Line numbers
opt.number = true              -- show absolute line numbers
opt.relativenumber = true      -- show relative numbers
opt.numberwidth = 4            -- width of the number column
opt.cursorline = false         -- highlight the current line

-- Search
opt.hlsearch = false           -- don't highlight search results
opt.ignorecase = true          -- ignore case in search patterns
opt.smartcase = true           -- override ignorecase if search contains capitals

-- Indentation
opt.expandtab = true           -- convert tabs to spaces
opt.shiftwidth = 4             -- number of spaces to use for autoindent
opt.tabstop = 4                -- number of spaces a tab counts for
opt.softtabstop = 4            -- number of spaces a tab counts for while editing
opt.smartindent = true         -- smart auto indent
opt.autoindent = true          -- copy indent from current line when starting new one
opt.breakindent = true         -- preserve indent when wrapping

-- Editing experience
opt.wrap = false               -- don't wrap long lines
opt.linebreak = true           -- wrap lines at word boundaries
opt.scrolloff = 4              -- minimal lines to keep above and below cursor
opt.sidescrolloff = 8          -- minimal columns to keep to left/right
opt.clipboard = 'unnamedplus'  -- sync system clipboard
opt.mouse = 'a'                -- enable mouse support
opt.undofile = true            -- persistent undo
opt.swapfile = false           -- disable swapfile
opt.backup = false             -- disable backup
opt.writebackup = false        -- disable write backup
opt.timeoutlen = 300           -- time to wait for mapped sequence (ms)
opt.updatetime = 250           -- faster completion
opt.whichwrap = 'bs<>[]hl'     -- allow cursor to move across lines with these keys
opt.pumheight = 10             -- pop-up menu height
opt.showmode = false           -- don't show --INSERT--
opt.showtabline = 2            -- always show tabline
opt.conceallevel = 0           -- don't conceal text in markdown
opt.fileencoding = 'utf-8'     -- file encoding
opt.cmdheight = 1              -- command line height

-- Completion options
opt.completeopt = 'menuone,noselect'
opt.shortmess:append 'c'

-- Split windows
opt.splitbelow = true
opt.splitright = true

-- Keywords
opt.iskeyword:append '-'       -- treat hyphenated words as one word

-- Formatting
opt.formatoptions:remove { 'c', 'r', 'o' }  -- don't auto insert comment leader

-- Runtime path
opt.runtimepath:remove '/usr/share/vim/vimfiles'

