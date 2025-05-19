---@diagnostic disable: undefined-global

return {
    {
        "stevearc/aerial.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("aerial").setup({
                layout = {
                    min_width = 60,
                },
                on_attach = function(bufnr)
                    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
                end,
            })

            vim.keymap.set("n", "mm", ":AerialToggle!<CR>", { noremap = true, silent = true, desc = "Toggle the code outline window" })
        end
    },
}

