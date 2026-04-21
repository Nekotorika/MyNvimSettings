return {
  {
    "echasnovski/mini.icons",
    opts = {},
    config = function(_, opts)
      local icons = require("mini.icons")
      icons.setup(opts)
      icons.mock_nvim_web_devicons()
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "echasnovski/mini.icons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      sources = { "filesystem", "buffers", "git_status" }, -- 必要に応じて
    },
    config = function()
      require("neo-tree").setup({
        window = {
          position = "left",
          width = 30,
          mappings = {},
        },

        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = true,
            hide_gitignored = false,
          },

          follow_current_file = {
            enabled = true,
          },
          group_empty_dirs = true,
        },

        default_component_configs = {
          indent = {
            with_expanders = true,
            expander_collapsed = "",
            expander_expanded = "",
          },
          icon = {
            use_filtered_colors = false,
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
            default = "*",
            highlight = "NeoTreeFileIcon",
          },
          git_status = {
            symbols = {
              added = "✚",
              modified = "",
              deleted = "✖",
              renamed = "󰁔",
              untracked = "",
              ignored = "",
              unstaged = "󰄱",
              staged = "",
              conflict = "",
            },
          },
        },
      })

      vim.keymap.set("n", "<leader>a", function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd("wincmd p")
        else
          local neotree_win = nil
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].filetype == "neo-tree" then
              neotree_win = win
              break
            end
          end
          if neotree_win then
            vim.api.nvim_set_current_win(neotree_win)
          else
            vim.cmd("Neotree focus")
          end
        end
      end, { desc = "Switch focus between Neo-tree and editor" })
      vim.api.nvim_set_hl(0, "NeoTreeDotfile", {
        fg = "#888888",
      })

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "NeoTreeDotfile", {
            fg = "#888888",
          })
        end,
      })
    end,
  },
}
