return {
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "echasnovski/mini.icons",
    },
    opts = function()
      return {
        general = {
          enable = function(buf, _)
            local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
            local bt = vim.api.nvim_get_option_value("buftype", { buf = buf })
            return not (ft == "neo-tree" or ft == "terminal" or ft == "Lazy" or bt == "terminal" or bt == "nofile")
          end,
        },
      }
    end,
    config = function(_, opts)
      require("dropbar").setup(opts)

      vim.keymap.set("n", "<leader>p", function()
        require("dropbar.api").pick()
      end, { desc = "Pick dropbar component" })
    end,
  },
}
