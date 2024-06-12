return {
        {
                "miikanissi/modus-themes.nvim",
        },
        {
                "mcchrish/zenbones.nvim",
                dependencies = {
                        "rktjmp/lush.nvim",
                },
                priority = 1000,
                config = function()
                        vim.cmd([[colorscheme modus]])
                end
        },
}
