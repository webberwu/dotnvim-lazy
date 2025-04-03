return {
    {
        "sainnhe/sonokai",
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
        config = function()
            -- default, andromeda, shusia, maia, atlantis
            vim.g.sonokai_style = "default"
            vim.cmd[[colorscheme sonokai]]

            require("lualine").setup({
                options = {
                    -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
                    theme = 'powerline',
                },
                sections = {
                    lualine_c = {
                        {
                            'filename',
                            -- 設為 1 表示顯示相對路徑，設為 2 則顯示絕對路徑
                            path = 1,
                        },
                    },
                    lualine_y = {
                        "progress",
                        {
                            -- total of lines
                            function()
                                return vim.fn.line("$")
                            end,
                        },
                    },
                },
            })

            -- preappend empty line in fugitiveblame window
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "fugitiveblame",
                callback = function()
                    local buf = vim.api.nvim_get_current_buf()

                    -- 延遲一下再新增開頭空行，避免有時遇到 fugitiveblame 視窗寬度只有一個字元的情況
                    vim.defer_fn(function()
                        if vim.api.nvim_buf_is_valid(buf) then
                            vim.api.nvim_buf_set_option(buf, "modifiable", true)
                            if vim.api.nvim_buf_line_count(buf) > 0 and vim.fn.getline(1) ~= "" then
                                vim.api.nvim_buf_set_lines(buf, 0, 0, false, { "" })
                            end
                            vim.api.nvim_buf_set_option(buf, "modifiable", false)
                        end
                    end, 50)
                end,
            })
        end
    },
}
