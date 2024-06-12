return {
  {
    -- Autoclose tags in .jsx
    "windwp/nvim-ts-autotag",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = false,
        -- Enable autotag for .jsx f files
        autotag = {
          enable = true,
        },
        highlight = {
          enable = true,
          disable = { 'astro' }
        },
        indent = { enable = true },
      })
    end,
  },
}
