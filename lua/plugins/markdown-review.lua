---@diagnostic disable: undefined-global

return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.opt.rtp:prepend(vim.fn.stdpath('data') .. '/lazy/markdown-preview.nvim')
            vim.fn["mkdp#util#install"]()
        end,
        config = function()
            vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown preview" })
            vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "Markdown preview stop" })
        end
    }
}
