return function()
  local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
  end

  local packer_bootstrap = ensure_packer()

  vim.cmd [[packadd packer.nvim]]
  vim.cmd [[xnoremap p P]]

  require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "nvim-tree/nvim-tree.lua"
    --use "nvim-tree/nvim-web-devicons"
    use "lewis6991/gitsigns.nvim"
    use "folke/tokyonight.nvim"
    use "udalov/kotlin-vim"
    use {
      "nvim-telescope/telescope.nvim", branch = "0.1.x",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use "neovim/nvim-lspconfig"
    use {
      "pmizio/typescript-tools.nvim",
      requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    }
    use {
      "zbirenbaum/neodim",
      event = "LspAttach",
      config = function()
        require("neodim").setup({
          alpha = 0.75,
          blend_color = "#000000",
          hide = {
            underline = false,
            virtual_text = false,
            signs = false,
          },
          regex = {
            "[uU]nused",
            "[nN]ever [rR]ead",
            "[nN]ot [rR]ead"
          },
          priority = 128,
          disable = {},
        })
      end
    }
    use "lukas-reineke/indent-blankline.nvim"

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'lukas-reineke/virt-column.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require("packer").sync()
    end
  end)
end
