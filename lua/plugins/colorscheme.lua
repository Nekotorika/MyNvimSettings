return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      color_overrides = {
        mocha = {
          base = "#16161f",
          mantle = "#12121a",
          crust = "#0d0d14",
          surface0 = "#20202a",
          surface1 = "#2a2a36",
          surface2 = "#343444",
        },
      },
      styles = {
        comments = { "italic" },
      },

      integrations = {
        snacks = true,
        telescope = true,
        treesitter = true,
        cmp = true,
        which_key = true,
      },
      custom_highlights = function(colors)
        return {
          Normal = { bg = colors.base },
          NormalNC = { bg = colors.base },
          NormalFloat = { bg = colors.base },
          LineNr = { fg = "#5a657a", bg = colors.base },
          CursorLineNr = { fg = colors.mauve, bold = true, bg = colors.base },
          SignColumn = { bg = colors.base },
          FoldColumn = { bg = colors.base },
          CursorLine = { bg = colors.surface0 },
          Visual = { bg = "#2a2a3a" },
          Search = { bg = "#3a3a4a", fg = colors.text },
          FloatBorder = { bg = colors.base },
          Pmenu = { bg = colors.base },
          ["@variable"] = { fg = colors.text },
          ["@parameter"] = { fg = colors.text },
        }
      end,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
