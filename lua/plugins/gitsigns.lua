---@diagnostic disable: undefined-global

return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup({
                current_line_blame = false,
                current_line_blame_formatter = " [<abbrev_sha>] <author> - <summary> (<author_time:%Y-%m-%d>)",
            })

            vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { noremap = true, silent = true, desc = "Git blame the current line" })
        end
    }
}
