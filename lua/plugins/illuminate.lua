---@diagnostic disable: undefined-global

return {
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require("illuminate").configure()

            vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#505050", bold = true })
            vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#505050", bold = true })
            vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#505050", bold = true })
        end,
    },
}
