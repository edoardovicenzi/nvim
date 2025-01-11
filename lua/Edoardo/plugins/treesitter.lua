return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = { "tsx", "javascript", "html", "css", "rust", "lua", "vim", "vimdoc", "query", "markdown" },

      sync_install = false,

      auto_install = false,

      indent = {
        enable = true,
      },

      ignore_install = {},

      modules = {},

      highlight = {
        enable = true,
        -- disable treesitter for large files
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = true,
      }
    })

    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  end
}
