return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- :h bufferline-configuration
        require("bufferline").setup({
            options = {
                mode = "tabs",
                numbers = "ordinal",
                show_close_icon = false,
                truncate_names = false,
            },
            highlights = {
                buffer_selected = {
                    bold = true,
                },
            },
        })
    end
}
