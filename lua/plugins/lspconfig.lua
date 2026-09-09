---@diagnostic disable: undefined-global

return {
    "neovim/nvim-lspconfig",
    cmd = { "Mason", "Neoconf" },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
        "folke/neoconf.nvim",
        "folke/neodev.nvim",
        {
            "j-hui/fidget.nvim",
            tag = "legacy",
        },
        {
            "nvimdev/lspsaga.nvim",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-tree/nvim-web-devicons",
            }
        }
    },
    config = function()
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            },
            -- backend
            dockerls = {},
            docker_compose_language_service = {},
            bashls = {},
            ansiblels = {},
            terraformls = {},
            tflint = {},
            nginx_language_server = {},
            pyright = {},
            sqlls = {},
            -- php
            intelephense = {
                on_init = function(client)
                    -- gh / gho 交給 phpactor，關掉避免 hover 出現兩份內容
                    client.server_capabilities.hoverProvider = false
                end,
            },
            phpactor = {
                on_init = function(client)
                    -- <leader>ca 交給 phpactor（intelephense 免費版沒有 code actions）
                    -- client.server_capabilities.codeActionProvider = false

                    -- gd 由 intelephense 負責（免費版就有 go to definition），關掉避免重複結果
                    client.server_capabilities.definitionProvider = false

                    -- gr 由 intelephense 負責（免費版就有 find all references），關掉避免重複結果
                    client.server_capabilities.referencesProvider = false

                    -- <leader>rn 交給 phpactor（intelephense 免費版沒有 rename）
                    -- client.server_capabilities.renameProvider = false

                    -- gi 交給 phpactor（intelephense 免費版沒有 find all implementations）
                    -- client.server_capabilities.implementationProvider = false

                    -- <leader>D 交給 phpactor（intelephense 免費版沒有 go to type definition）
                    -- client.server_capabilities.typeDefinitionProvider = false
                end,
                handlers = {
                    ["textDocument/publishDiagnostics"] = function() end,
                },
            },
            -- psalm = {},
            stimulus_ls = {},
            -- frontend
            eslint = {},
            ts_ls = {},
            html = {},
            cssls = {},
            tailwindcss = {},
            unocss = {},
            volar = {
                init_options = {
                    vue = {
                        hybridMode = false,
                    },
                    typescript = {
                        tsdk = vim.fn.stdpath('data') .. '/mason/packages/typescript-language-server/node_modules/typescript/lib',
                    },
                },
            },
            -- other
            jsonls = {},
            marksman = {},
            yamlls = {},
            lemminx = {},
            ast_grep = {},
        }
        local on_attach = function(client, bufnr)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('gd', function()
                require('telescope.builtin').lsp_definitions({
                    jump_type = 'never',
                    reuse_win = false,
                })
            end, "[G]oto [D]efinition")
            nmap('gh', "<cmd>Lspsaga hover_doc<CR>", "Hover Documentation")
            nmap('gho', vim.lsp.buf.hover, "Hover Documentation")
            nmap('gi', function()
                require "telescope.builtin".lsp_implementations({
                    jump_type = 'never',
                    reuse_win = false,
                })
            end, "[G]oto [I]mplementation")
            -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
            nmap('gr', require('telescope.builtin').lsp_references, "[G]oto [R]eferences")
            -- nmap('<C-k>', vim.lsp.buf.signature_help, "Signature Documentation")
            nmap('<leader>D', vim.lsp.buf.type_definition, "Type [D]efinition")
            nmap('<leader>rn', "<cmd>Lspsaga rename ++project<CR>", "[R]e[n]ame")
            nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", "[C]ode [A]ction")
            nmap('<leader>fd', require "telescope.builtin".diagnostics, "[F] [D]iagnostics")
            nmap("<leader>f", function()
                vim.lsp.buf.format { async = true }
            end, "[F]ormat code")
        end

        require("neoconf").setup()
        require("neodev").setup()
        require("fidget").setup()
        require("lspsaga").setup()
        require("mason").setup()

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
        })
        for server, config in pairs(servers) do
            require("lspconfig")[server].setup(
                vim.tbl_deep_extend("keep",
                    {
                        on_attach = on_attach,
                        capabilities = capabilities
                    },
                    config
                )
            )
        end

        vim.keymap.set('n', 'gd', '<cmd>tab split | lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true, desc = "LSP: [G]oto [D]efinition" })
        vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { noremap = true, silent = true, desc = "Lspsaga: next diagnostic" })
        vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { noremap = true, silent = true, desc = "Lspsaga: prev diagnostic" })
        vim.keymap.set("n", "]g", vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "LSP: next diagnostic" })
        vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "LSP: prev diagnostic" })
        vim.keymap.set('n', '<leader><space>', function()
            if vim.diagnostic.is_enabled() then
                vim.diagnostic.enable(false)
            else
                vim.diagnostic.enable(true)
            end
        end, { silent = true, noremap = true, desc = "LSP: toggle diagnostic display" })

        vim.keymap.set("v", "<leader>f", function()
            local start_pos = vim.api.nvim_buf_get_mark(0, "<")
            local end_pos = vim.api.nvim_buf_get_mark(0, ">")

            vim.lsp.buf.format({
                range = {
                    ["start"] = { line = start_pos[1] - 1, character = 0 },
                    ["end"]   = { line = end_pos[1], character = 0 },
                },
            })
            -- switch to normal mode
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
        end, { desc = "Format by range" })

        vim.diagnostic.config({
            virtual_text = false,
            float = {
                source = true,
            }
        })
    end
}
