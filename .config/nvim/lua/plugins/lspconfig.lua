return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      local lspconfig = require 'lspconfig'
      local configs = require 'lspconfig.configs'
      local util = require 'lspconfig.util'
      local function stop_server(server_name)
        for _, client in ipairs(vim.lsp.get_active_clients()) do
          if client.name == server_name then
            vim.lsp.stop_client(client.id)
            print(server_name .. " stopped successfully.")
            return
          end
        end
        print("Server not found: " .. server_name)
      end

      require('mason-lspconfig').setup({
        ensure_installed = { 'tsserver', 'volar', 'eslint', 'rust_analyzer', 'lua_ls', 'pyright' },
        handlers = {
          lsp_zero.default_setup,
          solidity_ls_nomicfoundation = function()
            configs.solidity = {
              default_config = {
                cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
                filetypes = { 'solidity' },
                root_dir = lspconfig.util.find_git_ancestor,
                single_file_support = true,
              },
            }

            lspconfig.solidity.setup {}
          end,
          volar = function()
            lspconfig.volar.setup({
              filetypes = { 'vue' },
              root_dir = util.root_pattern('App.vue', 'app.vue'),
              single_file_support = false,
              init_options = {
                vue = {
                  hybridMode = false,
                },
                typescript = {
                  tsdk = vim.fn.getcwd() ..
                      "node_modules/typescript",
                },
              },
              -- on_attach = function()
              --   stop_server('tsserver')
              -- end,
            })
          end,
          tsserver = function()
            lspconfig.tsserver.setup({
              root_dir = util.root_pattern("package.json"),
              single_file_support = false
            })
          end,
          denols = function()
            lspconfig.denols.setup({
              root_dir = util.root_pattern("deno.json", "deno.jsonc"),
              single_file_support = false
            })
          end,
          astro = function()
            lspconfig.astro.setup({})
          end,
          lua_ls = function()
            lspconfig.lua_ls.setup({
              on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                  return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force',
                  client.config.settings.Lua, {
                    runtime = {
                      -- Tell the language server which version of Lua you're using
                      -- (most likely LuaJIT in the case of Neovim)
                      version = 'LuaJIT'
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                      checkThirdParty = false,
                      library = {
                        vim.env.VIMRUNTIME
                        -- Depending on the usage, you might want to add additional paths here.
                        -- "${3rd}/luv/library"
                        -- "${3rd}/busted/library",
                      }
                      -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                      -- library = vim.api.nvim_get_runtime_file("", true)
                    }
                  })
              end,
              settings = {
                Lua = {}
              }
            })
          end,
        }
      })
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        lsp_zero.default_keymaps({ buffer = bufnr })
        vim.keymap.set('n', 'gn', vim.lsp.buf.rename, { buffer = bufnr })
      end)
        vim.keymap.set('n', 'gF', vim.lsp.buf.format, { buffer = bufnr })

      -- lsp_zero.format_on_save({
      --   format_opts = {
      --     async = true,
      --     timeout_ms = 10000,
      --   },
      --   servers = {
      --     ['tsserver'] = { 'javascript', 'typescript' },
      --     ['rust_analyzer'] = { 'rust' },
      --   }
      -- })
    end,
  },
}
