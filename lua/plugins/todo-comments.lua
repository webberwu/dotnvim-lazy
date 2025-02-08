return {
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("todo-comments").setup({
                keywords = {
                    NOTE = {
                        icon = " ",
                        color = "info",
                        alt = {
                            "NOTICE",
                            "INFO",
                        },
                    },
                },
                highlight = {
                    pattern = [[.*<(KEYWORDS)\s*:?]],
                }
            })

            vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "List todo comments" })
            vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
            vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
        end
    }
}
