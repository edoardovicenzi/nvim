return {
  "daenikon/marknav.nvim",
  ft = { "markdown", "md" },
  config = function()
    require("marknav").setup({
      use_default_keybinds = false
    })
  end,
  keys = {
    {
      '<Leader>mg',
      '<cmd>MarknavJump<CR>',
      desc = '[M]arknav [J]ump to file under cursor',
    },
    {
      '<Leader>mb',
      '<cmd>MarknavBack<CR>',
      desc = '[M]arknav [B]ack',
    },
    {
      '<Leader>ml',
      '<cmd>MarknavTab<CR>',
      desc = '[M]arknav open link in new [T]ab',
    },

  }
}
