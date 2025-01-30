return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      -- Setup servers
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      -- lsp declarations (add servers here)
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")

      -- START OF LSPs DECLARATION

      -- LUA
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      -- JS, React, html, css
      lspconfig.biome.setup({
        capabilities = capabilities,
        root_dir = function(fname)
          return util.root_pattern("biome.json", "biome.jsonc")(fname)
              or util.find_package_json_ancestor(fname)
              or util.find_node_modules_ancestor(fname)
              or util.find_git_ancestor(fname)
        end
      })
      -- PHP
      lspconfig.intelephense.setup({
        capabilities = capabilities,
        root_dir = function()
          return vim.loop.cwd()
        end,
      })
      -- Rust
      lspconfig.rust_analyzer.setup({

      })
      -- END OF LSPs DECLARATION

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          -- set formatter
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end
            })
          end

          -- set keybindings
          local opts = { buffer = args.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gK', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, opts)
          -- vim.keymap.set('n', '<space>la', vim.lsp.buf.add_workspace_folder, opts)
          -- vim.keymap.set('n', '<space>lr', vim.lsp.buf.remove_workspace_folder, opts)
          -- vim.keymap.set('n', '<space>ll', function()
          --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          -- end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end
      })
    end,
  }
}
