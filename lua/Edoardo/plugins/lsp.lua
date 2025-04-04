return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      "saghen/blink.cmp",
      "nvim-java/nvim-java",
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
      local os_name
      if vim.fn.has("win32") == 1 then
        os_name = "windows"
      elseif vim.fn.has("mac") == 1 then
        os_name = "macos"
      else
        os_name = "linux"
      end

      -- START OF LSPs DECLARATION

      -- LUA
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      -- JS, React, html, css
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
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
        capabilities = capabilities
      })
      -- Java
      lspconfig.jdtls.setup({
      })
      -- VB, C# dotnet
      -- Setup omnicharp cmd
      local pid = vim.fn.getpid()

      local omnisharp_bin
      if os_name == "windows" then
        omnisharp_bin = "C:\\Users\\VCNDRD98R\\omnisharp\\OmniSharp.exe"
      elseif os_name == "macos" then
        omnisharp_bin = ""
      elseif os_name == "linux" then
      end

      lspconfig.omnisharp.setup({
        cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
        -- cmd = { "dotnet", "/path/to/omnisharp/OmniSharp.dll" },
        settings = {
          FormattingOptions = {
            -- Enables support for reading code style, naming convention and analyzer
            -- settings from .editorconfig.
            EnableEditorConfigSupport = true,
            -- Specifies whether 'using' directives should be grouped and sorted during
            -- document formatting.
            OrganizeImports = nil,
          },
          MsBuild = {
            -- If true, MSBuild project system will only load projects for files that
            -- were opened in the editor. This setting is useful for big C# codebases
            -- and allows for faster initialization of code navigation features only
            -- for projects that are relevant to code that is being edited. With this
            -- setting enabled OmniSharp may load fewer projects and may thus display
            -- incomplete reference lists for symbols.
            LoadProjectsOnDemand = nil,
          },
          RoslynExtensionsOptions = {
            -- Enables support for roslyn analyzers, code fixes and rulesets.
            EnableAnalyzersSupport = nil,
            -- Enables support for showing unimported types and unimported extension
            -- methods in completion lists. When committed, the appropriate using
            -- directive will be added at the top of the current file. This option can
            -- have a negative impact on initial completion responsiveness,
            -- particularly for the first few completion sessions after opening a
            -- solution.
            EnableImportCompletion = nil,
            -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
            -- true
            AnalyzeOpenDocumentsOnly = nil,
          },
          Sdk = {
            -- Specifies whether to include preview versions of the .NET SDK when
            -- determining which version to use for project loading.
            IncludePrereleases = true,
          },
        },
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
