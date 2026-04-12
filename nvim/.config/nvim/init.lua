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

vim.opt.clipboard = "unnamedplus"
