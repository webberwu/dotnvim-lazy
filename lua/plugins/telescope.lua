return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "andrew-george/telescope-themes",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
    keys = {
        { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find file" },
        { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep({additional_args = {'--ignore-case', '--sort-files'}})<cr>", desc = "Live grep" },
        { "<leader>fhf", "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<cr>", desc = "Find file (hidden file included)" },
        { "<leader>fhg", "<cmd>lua require('telescope.builtin').live_grep({additional_args = {'--hidden', '--no-ignore', '--ignore-case', '--sort-files'}})<cr>", desc = "Live grep (hidden file included)" },
        { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true })<cr>" },
        { "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
        { "<leader>ft", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
        { "<leader>fp", "<cmd>lua require('telescope.builtin').builtin()<cr>" },
        { "<leader>fm", "<cmd>lua require('telescope.builtin').marks()<cr>" },
        { "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>" },
        { "<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>" },
        { "<leader>fc", "<cmd>lua require('telescope.builtin').commands()<cr>" },
        { "<leader>fs", "<cmd>Telescope themes<cr>" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.load_extension("themes")
        telescope.setup {
            defaults = {
                -- for live_grep
                --[[ vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--no-ignore",
                    "--hidden",
                    "--glob=!**/.git/*",
                    "--glob=!**/storage/*",
                    "--glob=!**/*.lock",
                }, ]]
                layout_strategy = 'flex',
                layout_config = {
                    width = 0.95,
                    height = 0.95,
                    horizontal = {
                        preview_width = 0.5,
                    },
                    vertical = {
                        preview_height = 0.5,
                    },
                },
                mappings = {
                    i = {
                        ["<C-c>"] = actions.close,
                        ["<C-n>"] = actions.cycle_history_next,
                        ["<C-p>"] = actions.cycle_history_prev,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,
                        ["<C-t>"] = actions.select_tab,
                        ["<C-s>"] = actions.select_horizontal,
                        ["<C-b>"] = actions.results_scrolling_up,
                        ["<C-f>"] = actions.results_scrolling_down,
                        ["<PageUp>"] = actions.results_scrolling_up,
                        ["<PageDown>"] = actions.results_scrolling_down,
                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                    n = {
                        ["<esc>"] = actions.close,
                        ["<C-s>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,
                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                        ["H"] = actions.move_to_top,
                        ["M"] = actions.move_to_middle,
                        ["L"] = actions.move_to_bottom,
                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,
                        ["gg"] = actions.move_to_top,
                        ["G"] = actions.move_to_bottom,
                        ["<C-b>"] = actions.preview_scrolling_up,
                        ["<C-f>"] = actions.preview_scrolling_down,
                        ["<PageUp>"] = actions.results_scrolling_up,
                        ["<PageDown>"] = actions.results_scrolling_down,
                        ["?"] = actions.which_key,
                    }
                },
            },
        }
    end
}
