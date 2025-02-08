return function()
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
    update_focused_file = { 
      enable = true 
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

  local function open_nvim_tree()
    -- open the tree
    require("nvim-tree.api").tree.open()
  end

  vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
end
