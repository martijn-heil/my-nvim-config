-- Basic setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.ignorecase = true
vim.o.scrolloff = 10

vim.wo.number = true

require("config/plugin/packer")()
require("config/plugin/mason")()
require("config/plugin/mason-lspconfig")()
require("config/plugin/gitsigns")()
require("config/plugin/nvim-tree")()
require("config/plugin/telescope")()
require("config/plugin/indent-blankline")()
require("config/plugin/nvim-cmp")()
require("config/plugin/virt-column")()

vim.cmd [[colorscheme tokyonight]]

-- Advanced setup
require("config/language/csharp")()
require("config/language/typescript")()
require("config/language/all")()
