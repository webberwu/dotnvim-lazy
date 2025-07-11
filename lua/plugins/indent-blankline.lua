return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufEnter",
    main = "ibl",
    opts = {
        scope = {
            enabled = false
        },
    },
    config = function(_, opts)
        require("ibl").setup(opts)

        local indent_enabled = true
        vim.keymap.set("n", "<leader>i", function()
            indent_enabled = not indent_enabled
            require("ibl").setup_buffer(0, { enabled = indent_enabled })

            vim.notify("Indent line " .. (indent_enabled and "enabled" or "disabled"))
        end, { desc = "Toggle indent-blankline" })
    end
}
