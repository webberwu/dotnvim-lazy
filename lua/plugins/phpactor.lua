---@diagnostic disable: undefined-global

return {
    {
        "phpactor/phpactor",
        ft = "php",
        build = "composer install --no-dev -o",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "php",
                callback = function()
                    vim.api.nvim_buf_set_keymap(0, "n", "<C-u>", ":call phpactor#UseAdd()<CR>", { noremap = true, silent = true })
                end,
            })
        end,
    },
}
