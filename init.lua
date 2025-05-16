vim.loader.enable()

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.ignorecase = true
vim.opt.mouse = ""
vim.opt.modeline = true
vim.opt.hidden = false
vim.opt.cursorline = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.history = 100
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showtabline = 2
vim.opt.tags:append({ "tags", "tags.vendors" })
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.smartcase = true
vim.opt.exrc = true
vim.opt.termguicolors = true
vim.opt.virtualedit = "block"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 6
vim.opt.colorcolumn = "120"
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

-- Setup lazy.nvim
require("lazy").setup("plugins", {
    checker = {
        enabled = false
    },
})

vim.keymap.set("", "ms", "^", { noremap = true, desc = "go to begin of the line" })
vim.keymap.set("", "me", "$", { noremap = true, desc = "go to end of the line" })
vim.keymap.set("n", "mh", "<cmd>nohlsearch<cr>", { noremap = true, desc = "no highlighting" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true, desc = "kkkk" })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bb", ":b#<CR>", { noremap = true, silent = true })
vim.keymap.set("n", ".rs", ":%s/\\s\\+$//<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "jm", "$", { noremap = true, silent = true })
vim.keymap.set("i", "jk", "->", { noremap = true, silent = true })
vim.keymap.set("i", "jl", "=>", { noremap = true, silent = true })

-- Highlight the trailing whitespaces
vim.api.nvim_set_hl(0, "TrailingWhitespace", { fg = "#F74971", bg = "#F74971" })
vim.cmd([[match TrailingWhitespace /\s\+$/]])

-- Auto reload while file changed
vim.opt.autoread = true
vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    command = "checktime",
})
