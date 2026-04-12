return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- recommended for nice icons
    "MunifTanjim/nui.nvim",
  },
  opts = {
    window = {
      width = 30, -- adjust as you like
      mappings = {
        ["h"] = "navigate_up", -- ← Go back/up one directory
        ["<bs>"] = "navigate_up", -- keep Backspace as backup
        ["l"] = "open", -- open file or enter folder
        ["<cr>"] = "open",
        ["H"] = "toggle_hidden", -- toggle dotfiles (hidden files)
        ["."] = "set_root", -- set current folder as new root (cd)
      },
    },

    filesystem = {
      bind_to_cwd = true, -- sync with Neovim's cwd
      follow_current_file = {
        enabled = true, -- focus current file when opening
      },
      use_libuv_file_watcher = true,
    },
  },

  -- Add leader keybinding here
  keys = {
    {
      "<leader>z", -- ← Change this if you want another key
      function()
        require("neo-tree.command").execute({
          toggle = true,
          source = "filesystem",
          position = "left", -- or "right", "float", "current"
        })
      end,
      desc = "Toggle Neo-tree (File Explorer)",
      mode = "n",
    },
  },
}
-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   opts = {
--     window = {
--       mappings = {
--         ["h"] = "navigate_up",
--         filesystem = {
--           bind_to_cwd = true, -- 🔥 cwd এর সাথে bind করবে
--           follow_current_file = {
--             enabled = true,
--           },
--           use_libuv_file_watcher = true,
--         },
--       },
--     },
--   },
-- }
--
--
