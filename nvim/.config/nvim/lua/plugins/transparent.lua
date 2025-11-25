return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight", -- ensure we use it
    },
  },
  {
    -- Global highlights to remove any leftover backgrounds
    "nvim-tree/nvim-web-devicons",
    config = function()
      vim.cmd([[
        hi Normal guibg=none
        hi NormalFloat guibg=none
        hi FloatBorder guibg=none
        hi NormalNC guibg=none
        hi SignColumn guibg=none
        hi LineNr guibg=none
        hi Folded guibg=none
      ]])
    end,
  },
}
