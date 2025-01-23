return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      local oil = require("oil");

      oil.setup({
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, bufnr)
            local m = name:match("^node_modules")
            return m ~= nil
          end
        }
      })
    end
  }
}
