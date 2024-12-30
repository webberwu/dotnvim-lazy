return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- set this if you want to always pull the latest change
        opts = {
            -- add any opts here
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "Avante" },
                },
                ft = { "Avante" },
            },
        },
        config = function()
            require("avante").setup({
                provider = "openai",
                system_prompt = [[
                    扮演軟體開發專家，編碼時始終使用最佳實踐，尊重並使用代碼庫中已經存在的約定、套件等，使用繁體中文回答
                ]],
                history = {
                    -- ~/.local/state/nvim
                    storage_path = vim.fn.stdpath("state") .. "/avante",
                    paste = {
                        extension = "png",
                        filename = "pasted-%Y-%m-%d-%H-%M-%S",
                    },
                },
                mappings = {
                    submit = {
                        normal = "<C-j>",
                        insert = "<C-j>",
                    },
                    ask = " aa",
                },
                windows = {
                    width = 45,
                },
            })
        end
    },
}
