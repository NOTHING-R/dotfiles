return {
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",

    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },

  -- nvim-cmp
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      "zbirenbaum/copilot-cmp",
    },

    config = function()
      local cmp = require("cmp")

      require("copilot_cmp").setup()

      cmp.setup({
        sources = cmp.config.sources({
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- copilot-cmp
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      "zbirenbaum/copilot.lua",
    },
  },
}

-- return {
--
--
--   -- Copilot
--   {
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     event = "InsertEnter",
--     config = function()
--       require("copilot").setup({
--         suggestion = { enabled = false },
--         panel = { enabled = false },
--       })
--     end,
--   },
--
--   -- Copilot CMP
--   {
--     "zbirenbaum/copilot-cmp",
--     dependencies = {
--       "zbirenbaum/copilot.lua",
--     },
--     config = function()
--       require("copilot_cmp").setup()
--     end,
--   },
--
--   -- nvim-cmp setup
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "zbirenbaum/copilot-cmp",
--     },
--     config = function()
--       local cmp = require("cmp")
--
--       cmp.setup({
--         sources = cmp.config.sources({
--           { name = "copilot", group_index = 2 },
--           { name = "nvim_lsp", group_index = 2 },
--           { name = "luasnip", group_index = 2 },
--         }, {
--           { name = "buffer" },
--           { name = "path" },
--         }),
--       })
--     end,
--   },
-- }
