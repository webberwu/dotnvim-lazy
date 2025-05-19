---@diagnostic disable: undefined-global

return {
    {
        "mg979/vim-visual-multi",
        event = "VeryLazy",
        config = function()
            vim.keymap.set("i", "<C-c>", "<Esc>:VMExit<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<C-c>", "<Esc>", { remap = true })
        end
    },
}
