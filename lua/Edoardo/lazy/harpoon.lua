return {
    'ThePrimeagen/harpoon',
    config = function()
        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')

        vim.keymap.set("n", "<leader>ha", mark.add_file, {desc = "Harpoon mark current file"})
        vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, {desc = "Open harpoon context menu"})

        vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end, {desc = "Harpoon go to file 1"})
        vim.keymap.set("n", "<leader>ht", function() ui.nav_file(2) end, {desc = "Harpoon go to file 2"})
        vim.keymap.set("n", "<C<leader>hn", function() ui.nav_file(3) end, {desc = "Harpoon go to file 3"})
        vim.keymap.set("n", "<leader>hs", function() ui.nav_file(4) end, {desc = "Harpoon go to file 4"})
    end
}
