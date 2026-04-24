-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     opts = function(_, opts)
--       local cmp = require("cmp")
--
--       -- Helper function to check if there are words before cursor
--       local has_words_before = function()
--         unpack = unpack or table.unpack
--         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--         return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--       end
--
--       opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
--         -- Tab: Complete suggestion (select + confirm)
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.confirm({ select = true }) -- This completes with Tab
--           elseif vim.snippet.active({ direction = 1 }) then
--             vim.schedule(function()
--               vim.snippet.jump(1)
--             end)
--           elseif has_words_before() then
--             cmp.complete()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--
--         -- Shift-Tab: Previous item or snippet jump back
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           elseif vim.snippet.active({ direction = -1 }) then
--             vim.schedule(function()
--               vim.snippet.jump(-1)
--             end)
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--
--         -- Enter: Only confirm if you manually selected something, otherwise newline
--         ["<CR>"] = cmp.mapping(function(fallback)
--           if cmp.visible() and cmp.get_selected_entry() then
--             cmp.confirm({ select = false })
--           else
--             fallback() -- normal Enter (new line)
--           end
--         end, { "i", "s" }),
--       })
--     end,
--   },
-- }

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      print("Loading nvim-cmp config")
      -- ... rest of the code

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true }) -- Select the current item with Tab
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete() -- Trigger completion if there are words before the cursor
          else
            fallback() -- Fallback to default Tab behavior
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item() -- Move to previous item with Shift-Tab
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<CR>"] = cmp.config.disable, -- Disable Return key for autocompletion
      })
    end,
  },
}
