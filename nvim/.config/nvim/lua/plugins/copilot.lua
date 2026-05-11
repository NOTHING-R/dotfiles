return {
  "github/copilot.vim",
  lazy = false,
  config = function()
    vim.g.copilot_no_tab_map = true

    -- Accept suggestion with Ctrl+j
    vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      desc = "Accept Copilot suggestion",
    })

    -- Cycle through suggestions
    vim.keymap.set("i", "<C-]>", "<Plug>(copilot-next)", { desc = "Next suggestion" })
    vim.keymap.set("i", "<C-[>", "<Plug>(copilot-previous)", { desc = "Prev suggestion" })

    -- Dismiss suggestion
    vim.keymap.set("i", "<C-e>", "<Plug>(copilot-dismiss)", { desc = "Dismiss suggestion" })
  end,
}
