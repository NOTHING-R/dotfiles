return {
  "windwp/nvim-autopairs",
  config = function(_, opts)
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")

    npairs.setup(opts)

    -- Enable {} pairing inside Python strings
    npairs.add_rules({
      Rule("{", "}"):with_pair(function()
        return vim.bo.filetype == "python"
      end),
    })
  end,
}
