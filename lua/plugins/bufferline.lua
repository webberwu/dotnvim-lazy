return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("bufferline").setup({
            options = {
                mode = "tabs",
                numbers = "ordinal",
                show_close_icon = false,
            },
            highlights = {
                buffer_selected = {
                    bold = true,
                },
            },
        })
    end
}
