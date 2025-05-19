---@diagnostic disable: undefined-global

return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "gbb", "<cmd>Git blame<CR>", { noremap = true, silent = true })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "fugitiveblame",
            callback = function()
                vim.keymap.set("n", "<C-t>", "O", { remap = true })
            end,
        })
    end,
}
