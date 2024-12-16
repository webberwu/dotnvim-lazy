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
        { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Live grep" },
        { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true })<cr>" },
        { "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
        { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
        { "<leader>fp", "<cmd>lua require('telescope.builtin').builtin()<cr>" },
        { "<leader>fm", "<cmd>lua require('telescope.builtin').marks()<cr>" },
        { "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>" },
        { "<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>" },
        { "<leader>fc", "<cmd>lua require('telescope.builtin').commands()<cr>" },
        { "<leader>ft", "<cmd>Telescope themes<cr>" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes?tab=readme-ov-file#file-and-text-search-in-hidden-files-and-directories
        -- clone the default Telescope configuration
        local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }
        -- search in hidden/dot files.
        table.insert(vimgrep_arguments, "--hidden")
        -- table.insert(vimgrep_arguments, "--no-ignore")
        -- don't search in the `.git` directory.
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!**/.git/*")
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!**/storage/*")
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!*.lock")

        telescope.load_extension("themes")
        telescope.setup {
            pickers = {
                find_files = {
                    file_ignore_patterns = { "node_modules", ".git", "vendor", ".venv", ".nvim"},
                    find_command = { "rg", "--no-ignore", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },
            defaults = {
                vimgrep_arguments = vimgrep_arguments,
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
                        ["<C-x>"] = actions.select_horizontal,
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
