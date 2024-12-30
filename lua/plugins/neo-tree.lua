return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<CR>", mode = { "n", "v" }, desc = "Open the neo-tree" }
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    mappings = {
                        ["<C-t>"] = "open_tabnew"
                    }
                },
                filesystem = {
                    filtered_items = {
                        hide_hidden = false,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                    }
                },
            })
        end
    },
}
