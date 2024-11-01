return {
    {
        "terryma/vim-multiple-cursors",
        event = "VeryLazy",
        config = function()
            vim.g.multi_cursor_start_key = '<C-n>'
            vim.g.multi_cursor_next_key = '<C-n>'
            vim.g.multi_cursor_prev_key = '<C-p>'
            vim.g.multi_cursor_skip_key = '<C-x>'
            vim.g.multi_cursor_quit_key = '<C-c>'

            vim.keymap.set("n", "<C-c>", ":call multiple_cursors#quit()<CR>", { noremap = true, silent = true })
        end
    },
}
