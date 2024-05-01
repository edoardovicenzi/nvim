function MyColorPencil(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
end
return{
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require('rose-pine').setup({
            styles = {
                italic = false,
            }
        })
        vim.cmd('colorscheme rose-pine')
        MyColorPencil()
    end
}
