return {
    'nosduco/remote-sshfs.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' }, -- optional if you declare plugin somewhere else
    config = function ()
        require('remote-sshfs').setup({})

        local api = require('remote-sshfs.api')
        vim.keymap.set('n', '<leader>rc', api.connect, {})
        vim.keymap.set('n', '<leader>rd', api.disconnect, {})
        vim.keymap.set('n', '<leader>re', api.edit, {})       require('telescope').load_extension 'remote-sshfs'
    end
}
