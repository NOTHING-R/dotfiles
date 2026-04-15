return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    window = {
      width = 30,
      mappings = {
        ["h"] = "navigate_up",
        ["<bs>"] = "navigate_up",
        ["l"] = "open",
        ["<cr>"] = "open",
        ["H"] = "toggle_hidden",
        ["."] = "set_root",

        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["<C-r>"] = "clear_clipboard",

        ["c"] = "copy",
        ["m"] = "move",

        ["a"] = "add",
        ["A"] = "add_directory",
      },
    },

    filesystem = {
      bind_to_cwd = true,
      hijack_netrw_behavior = "disabled",
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },

    -- This line often fixes the "modifiable is off" error
    enable_normal_mode_for_inputs = false,
  },

  keys = { ... }, -- your <leader>z toggle
}

--
-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-tree/nvim-web-devicons", -- recommended for nice icons
--     "MunifTanjim/nui.nvim",
--   },
--   opts = {
--     window = {
--       width = 30, -- adjust as you like
--       mappings = {
--         ["h"] = "navigate_up", -- ← Go back/up one directory
--         ["<bs>"] = "navigate_up", -- keep Backspace as backup
--         ["l"] = "open", -- open file or enter folder
--         ["<cr>"] = "open",
--         ["H"] = "toggle_hidden", -- toggle dotfiles (hidden files)
--         ["."] = "set_root", -- set current folder as new root (cd)
--       },
--     },
--
--     filesystem = {
--       bind_to_cwd = true, -- sync with Neovim's cwd
--       hijack_netrw_behavior = "disabled", -- ← Add this line
--       follow_current_file = {
--         enabled = true, -- focus current file when opening
--       },
--       use_libuv_file_watcher = true,
--     },
--   },
--
--   -- Add leader keybinding here
--   keys = {
--     {
--       "<leader>z", -- ← Change this if you want another key
--       function()
--         require("neo-tree.command").execute({
--           toggle = true,
--           source = "filesystem",
--           position = "left", -- or "right", "float", "current"
--         })
--       end,
--       desc = "Toggle Neo-tree (File Explorer)",
--       mode = "n",
--     },
--   },
-- }
--
--
--
