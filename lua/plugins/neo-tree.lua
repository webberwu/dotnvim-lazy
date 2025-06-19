---@diagnostic disable: undefined-global, redundant-parameter

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
                close_if_last_window = true,
                window = {
                    mappings = {
                        ["<C-t>"] = function(state)
                            local node = state.tree:get_node()
                            local filepath = node:get_id()
                            -- open file in new tab
                            vim.cmd("tabnew " .. filepath)
                            -- focus neo-tree
                            vim.cmd("wincmd p")
                        end,
                        ["oa"] = "avante_add_files",
                    }
                },
                filesystem = {
                    filtered_items = {
                        hide_hidden = false,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                    }
                },
                commands = {
                    -- from https://github.com/yetone/avante.nvim/blob/main/README.md#neotree-shortcut
                    avante_add_files = function(state)
                        local node = state.tree:get_node()
                        local filepath = node:get_id()
                        local relative_path = require('avante.utils').relative_path(filepath)

                        local sidebar = require('avante').get()

                        local open = sidebar:is_open()
                        -- 確保 avante 側邊欄已打開
                        if not open then
                            require('avante.api').ask()
                            sidebar = require('avante').get()
                        end

                        sidebar.file_selector:add_selected_file(relative_path)

                        -- 刪除 neo tree 緩沖區
                        if not open then
                            sidebar.file_selector:remove_selected_file('neo-tree filesystem [1]')
                        end
                    end,
                },
            })
        end
    },
}
