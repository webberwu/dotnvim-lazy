return {
    {
        "danymat/neogen",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("neogen").setup()

            vim.keymap.set("n", "<C-k>", require("neogen").generate, { noremap = true, silent = true })
        end
    }
}
