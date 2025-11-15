# dotnvim-lazy

## Installation

```shell
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

ln -s <YOUR_REPO_PATH> ~/.config/nvim
```

## Plugins

| plugin | description |
| --- | --- |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | 程式碼大綱檢視器，類似 VS Code 的 Outline 功能 |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | 一個美觀的 Neovim 啟動畫面 |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | 自動配對括號、引號等符號 |
| [avante.nvim](https://github.com/yetone/avante.nvim) | 讓 Neovim 成為 AI IDE |
| [vim-blade](https://github.com/jwalton512/vim-blade) | 針對 Laravel Blade template engine 的 syntax highlight 和 indent |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | 在 Neovim 頂部顯示一個優雅的緩衝區/分頁列 |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) | 即時 highlight 顯示文件中的顏色代碼 |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | 快速註解/取消註解程式碼 |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | 一個強大的 Git 整合 plugin |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | 在符號欄 (sign column) 顯示 Git 的新增、修改、刪除狀態 |
| [vim-illuminate](https://github.com/RRethy/vim-illuminate) | 當游標停在一個單字上時，自動 highlight 所有相同的單字 |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | 顯示縮排參考線 |
| [nvim-lastplace](https://github.com/ethanholz/nvim-lastplace) | 自動記住上次離開檔案的位置 |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | 一個非同步的程式碼檢查框架 |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Neovim 的 Language Server Protocol (LSP) 客戶端設定集合 |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | 在瀏覽器中即時預覽 Markdown 文件 |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | 一個功能豐富的檔案總管 |
| [neogen](https://github.com/danymat/neogen) | 自動產生註解 (DocBlocks) |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | 一個美觀的 Neovim 通知管理器 |
| [phpactor](https://github.com/phpactor/phpactor) | 針對 PHP 的重構和程式碼分析工具 |
| [vim-surround](https://github.com/tpope/vim-surround) | 快速新增、修改、刪除成對的符號 (例如括號、引號) |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | 一個高度可擴展的模糊搜尋器 |
| [sonokai](https://github.com/sainnhe/sonokai) | theme |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | highlight 並搜尋程式碼中的 TODO、FIXME 等關鍵字 |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 提供更精確的語法高亮和程式碼分析 |
| [vim-visual-multi](https://github.com/mg979/vim-visual-multi) | 多游標編輯功能 |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | 當輸入部分快捷鍵時，顯示可能的後續按鍵 |
| [vim-maximizer](https://github.com/szw/vim-maximizer) | 切換當前 window 最大化 |

### Dependencies

| plugin | description |
| --- | --- |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [barbecue.nvim](https://github.com/utilyre/barbecue.nvim) | 類似 VS Code 的 winbar |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | nvim-cmp 的 buffer 來源 |
| [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) | nvim-cmp 的 command line 來源 |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | nvim-cmp 的 LSP 來源 |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | nvim-cmp 的檔案路徑來源 |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | nvim-cmp 的 LuaSnip 來源 |
| [dressing.nvim](https://github.com/stevearc/dressing.nvim) | 美化 `vim.ui.input` 和 `vim.ui.select` |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | 顯示 LSP 進度的獨立 UI |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | 常用的程式碼片段集合 |
| [img-clip.nvim](https://github.com/HakonHarnes/img-clip.nvim) | 從剪貼簿貼上圖片 |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Neovim 的 plugin manager |
| [lspkind.nvim](https://github.com/onsails/lspkind.nvim) | 為 LSP 補全加上圖示 |
| [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim) | 提供 LSP 功能 UI 的 plugin |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 一個快速且易於設定的狀態列 |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | 整合 mason.nvim 和 nvim-lspconfig |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Neovim 的可攜式套件管理器 |
| [neoconf.nvim](https://github.com/folke/neoconf.nvim) | Neovim 的設定管理器 |
| [neodev.nvim](https://github.com/folke/neodev.nvim) | 針對 init.lua 和 plugin development 的 Neovim 設定 |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim) | Neovim 的 UI library |
| [nvim-navic](https://github.com/SmiteshP/nvim-navic) | 顯示目前程式碼上下文的狀態列元件 |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | nvim-treesitter 的額外 textobjects |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | vim-devicons 的 Lua 版本 |
| [playground](https://github.com/nvim-treesitter/playground) | 用於測試程式碼的暫存緩衝區 |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | 功能齊全的 Neovim Lua library |
| [render-markdown.nvim](https://github.com/MeoMix/render-markdown.nvim) | 在 Neovim 中渲染 Markdown |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | 用 C 寫的 Telescope FZF 排序器 |
| [telescope-themes](https://github.com/nvim-telescope/telescope-themes.nvim) | Telescope 的主題集合 |

## Keymaps

| plugin | keymap | description |
| --- | --- | --- |
| **Global** | | |
| aerial.nvim | `mm` | 切換程式碼大綱視窗 |
| aerial.nvim | `{` | 上一個符號 |
| aerial.nvim | `}` | 下一個符號 |
| indent-blankline.nvim | `<leader>i` | Toggle indent-blankline |
| neo-tree.nvim | `<leader>e` | 切換檔案總管 |
| LSP | `<leader><space>` | 切換 LSP 診斷訊息顯示 |
| LSP | `]g` | 下一個診斷 |
| LSP | `[g` | 上一個診斷 |
| Lspsaga | `]d` | 下一個診斷 |
| Lspsaga | `[d` | 上一個診斷 |
| todo-comments.nvim | `]t` | 下一個 TODO 註解 |
| todo-comments.nvim | `[t` | 上一個 TODO 註解 |
| vim-visual-multi | `<C-c>` (插入模式) | 離開多游標模式 |
| vim-visual-multi | `<C-c>` (一般模式) | 離開多游標模式 |
| **Telescope** | | |
| Telescope | `<leader>ff` | 尋找檔案（使用 `<C-t>` 可在新分頁開啟檔案，`<C-v>` 可垂直開啟檔案，`<C-s>` 可水平開啟檔案） |
| Telescope | `<leader>fg` | 全域搜尋 (Live Grep) |
| Telescope | `<leader>fhf` | 尋找檔案 (包含隱藏檔) |
| Telescope | `<leader>fhg` | 全域搜尋 (包含隱藏檔) |
| Telescope | `<leader>fb` | 尋找緩衝區 |
| Telescope | `<leader>fo` | 尋找最近開啟的檔案 |
| Telescope | `<leader>ft` | 尋找說明文件標籤 |
| Telescope | `<leader>fp` | 尋找 Telescope 內建功能 |
| Telescope | `<leader>fm` | 尋找標記 |
| Telescope | `<leader>fk` | 尋找快捷鍵 |
| Telescope | `<leader>fq` | 尋找 Quickfix 列表 |
| Telescope | `<leader>fc` | 尋找指令 |
| Telescope | `<leader>fs` | 選擇 Telescope 主題 |
| todo-comments.nvim | `<leader>ft` | 尋找 TODO 註解 |
| **LSP related** | | |
| LSP | `gd` | 前往定義 (在新的分頁中開啟) |
| Lspsaga | `gh` | 顯示文件懸浮提示 |
| LSP | `gho` | 顯示文件懸浮提示 (原生) |
| LSP | `gi` | 前往實作 |
| LSP | `gr` | 前往參考 |
| LSP | `<leader>D` | 前往型別定義 |
| Lspsaga | `<leader>rn` | 重構：重新命名 |
| Lspsaga | `<leader>ca` | 顯示可用的程式碼操作 |
| Telescope | `<leader>fd` | 顯示診斷訊息 |
| LSP | `<leader>f` | 格式化程式碼 |
| LSP | `<leader>f` (visual) | Format selected range |
| **Git related** | | |
| vim-fugitive | `gbb` | 顯示目前檔案的 `Git blame` |
| gitsigns.nvim | `<leader>gb` | 切換目前行的 `Git blame` |
| vim-fugitive | `<C-t>` (在 `fugitiveblame` 視窗中) | 前往該行的提交 |
| **Others** | | |
| Avante | `<C-j>` | 提交 AI 請求 |
| Avante | ` aa` | 向 AI 提問 |
| neogen | `<C-k>` | 產生註解 |
| phpactor | `<C-u>` (僅限 PHP 檔案) | 新增 `use` 宣告 |
| markdown-preview.nvim | `<leader>mp` | 啟動 Markdown 預覽 |
| markdown-preview.nvim | `<leader>ms` | 停止 Markdown 預覽 |
| neo-tree.nvim | `<C-t>` (在 neo-tree 視窗中) | 在新分頁開啟檔案 |
| neo-tree.nvim | `oa` (在 neo-tree 視窗中) | 將檔案加入 Avante 側邊欄 |
| vim-maximizer | `<C-w>m` | 切換當前 window 最大化 |

## References

* [Nerd Fonts](https://www.nerdfonts.com/font-downloads) - [DejaVuSansM Nerd Font](https://www.programmingfonts.org/#dejavu)
* [kickstart.nix](https://github.com/dmmulroy/kickstart.nix/tree/main/config/nvim)
* [FledgeXu/NeovimZero2Hero](https://github.com/FledgeXu/NeovimZero2Hero/tree/main)
