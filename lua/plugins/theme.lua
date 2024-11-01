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
                        }
                    },
                },
            })
        end
    },
}
