return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "kirasok/cmp-hledger",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local cmp_action = require('lsp-zero').cmp_action()
      require("luasnip.loaders.from_vscode").lazy_load()

      vim.g.ledger_is_hledger = true
      vim.g.ledger_bin = '/usr/bin/hledger'

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        window = {
          -- Uncomment it if you like window style bordered.
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp_action.tab_complete(),
          ['<S-Tab>'] = cmp_action.select_prev_or_fallback()

          -- Jump to next position in snippets with Tab and Shift + Tab
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "buffer" },
          { name = "path" },
          { name = "hledger" },
          { name = "txt" },
        }),
      })
    end,
  },
}
