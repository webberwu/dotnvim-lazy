return {
    {
        "mfussenegger/nvim-lint",
        config = function()
            require("lint").linters_by_ft = {
                php = {
                    "phpcs",
                }
            }

            vim.api.nvim_create_autocmd({"BufReadPost", "BufWritePost", "InsertLeave", "TextChanged"}, {
                callback = function()
                    require("lint").try_lint()
                end,
            })

            require('lint').linters.phpcs.args = {
                "-q",
                "--standard=PSR12",
                "--report=json",
                "-",
            }
        end,
    },
}
