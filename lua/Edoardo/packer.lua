-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use({ 
        'rose-pine/neovim', 
        as = 'rose-pine',
        config = function() vim.cmd('colorscheme rose-pine') end })

        use (
        'nvim-treesitter/nvim-treesitter',
        {run = ':TSUpdate'}
        )
        use ('MunifTanjim/prettier.nvim')
        use ('jose-elias-alvarez/null-ls.nvim')
        use 'windwp/nvim-ts-autotag'
        use 'windwp/nvim-autopairs'
        use ('ThePrimeagen/harpoon')
        use ('mbbill/undotree')
        use ('tpope/vim-fugitive')
        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            requires = {
                --- Uncomment these if you want to manage LSP servers from neovim
                {'williamboman/mason.nvim'},
                {'williamboman/mason-lspconfig.nvim'},

                -- LSP Support
                {'neovim/nvim-lspconfig'},
                -- Autocompletion
                {'hrsh7th/nvim-cmp'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'L3MON4D3/LuaSnip'},
            }
        }
    use {
        'Selyss/mind.nvim',
        branch = 'v2.2',
        requires = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, used for icons
        },
        config = function()
            require'mind'.setup()
        end
    }
    require'nvim-web-devicons'.setup{}
    end)
