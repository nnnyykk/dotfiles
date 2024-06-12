return {
        {
                "nvim-telescope/telescope-ui-select.nvim",
        },
        {
                "neanias/telescope-lines.nvim"
        },
        {
                "nvim-telescope/telescope.nvim",
                tag = "0.1.5",
                dependencies = { "nvim-lua/plenary.nvim" },
                config = function()
                        local telescope = require("telescope")
                        telescope.setup({
                                extensions = {
                                        defaults = {
                                                file_ignore_patterns = { "^node_modules/" },
                                        },
                                        ["ui-select"] = {
                                                require("telescope.themes").get_dropdown({}),
                                        },
                                        lines = {
                                                hide_empty_lines = true,
                                                trim_lines = true,
                                        }
                                },
                        })
                        telescope.load_extension("lines")
                        local builtin = require("telescope.builtin")
                        vim.keymap.set("n", "<leader>F", builtin.find_files, {})
                        vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
                        vim.keymap.set("n", "<leader>B", builtin.buffers, {})
                        vim.keymap.set("n", "<leader>Q", builtin.quickfix, {})
                        vim.keymap.set("n", "<leader>L", telescope.extensions.lines.lines, {})

                        require("telescope").load_extension("ui-select")
                end,
        },
}
