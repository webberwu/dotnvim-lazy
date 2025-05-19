---@diagnostic disable: undefined-global

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

            -- phpcs
            -- https://github.com/mfussenegger/nvim-lint/pull/650#issuecomment-2329289179
            local phpcs_standard = "PSR12"
            if vim.fn.filereadable(vim.loop.cwd() .. "/phpcs.xml") == 1 then
                phpcs_standard = vim.loop.cwd() .. "/phpcs.xml"
            elseif vim.fn.filereadable(vim.fn.expand("~/phpcs.xml")) == 1 then
                phpcs_standard = vim.fn.expand("~/phpcs.xml")
            end
            require("lint").linters.phpcs.args = {
                "-q",
                "--standard=" .. phpcs_standard,
                "--report=json",
                "-",
            }
        end,
    },
}
