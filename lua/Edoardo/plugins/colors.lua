local defaultColor = "catppuccin-mocha"
function MyColorPencil(color)
  color = color or defaultColor
  vim.cmd.colorscheme(color)
  vim.cmd('highlight Normal guibg=none')
end

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      no_italic = true
    })
    MyColorPencil()
  end
}
