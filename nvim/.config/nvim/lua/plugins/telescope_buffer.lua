return {
  "nvim-telescope/telescope.nvim",
  keys = {

    -- disable the default grep keymap
    { "<leader>.", false },
    -- SPC . → find files
    {
      "<leader>.",
      "<cmd>Telescope find_files<CR>",
      desc = "Find Files",
    },
    -- add SPC-b-i for buffer list
    {
      "<leader>bi",
      function()
        require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = false })
      end,
      desc = "Buffer List",
    },
  },
}
