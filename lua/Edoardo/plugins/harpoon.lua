return {
  'ThePrimeagen/harpoon',
  config = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    vim.keymap.set("n", "<leader>hm", mark.add_file, { desc = "Harpoon mark file" })
    vim.keymap.set("n", "<leader>ha", ui.toggle_quick_menu, { desc = "Harpoon open ui list" })

    vim.keymap.set("n", "<leader>hb", function() ui.nav_file(1) end, { desc = "Harpoon open file 1" })
    vim.keymap.set("n", "<leader>ht", function() ui.nav_file(2) end, { desc = "Harpoon open file 2" })
    vim.keymap.set("n", "<leader>hn", function() ui.nav_file(3) end, { desc = "Harpoon open file 3" })
    vim.keymap.set("n", "<leader>hs", function() ui.nav_file(4) end, { desc = "Harpoon open file 4" })
  end
}
