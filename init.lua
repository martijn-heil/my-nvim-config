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

vim.cmd [[packadd packer.nvim]]
vim.cmd [[xnoremap p P]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-tree.lua'
  --use 'nvim-tree/nvim-web-devicons'
  use 'lewis6991/gitsigns.nvim'
  use 'folke/tokyonight.nvim'
end)

vim.g.nvim_tree_show_icons = {
  folders = 0,
  files = 0,
  git = 0,
  folder_arrows = 0
}

require("nvim-tree").setup({
	view = {
		width = 50
	},
  git = {
    enable = false
  },
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
        diagnostics = false,
        modified = false,
      }
    }
  }
})

require('gitsigns').setup()

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.cmd [[colorscheme tokyonight]]

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
