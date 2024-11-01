return {
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require("illuminate").configure()

            vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#565656", bold = true })
            vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#565656", bold = true })
            vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#565656", bold = true })
        end,
    },
}
