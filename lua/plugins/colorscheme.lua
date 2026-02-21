return {
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({
        options = {
          transparent = false,
          terminal_colors = true,
        },
        styles = {
          comments = "italic",
          keywords = "bold",
          functions = "italic,bold",
        },
      })
      vim.cmd.colorscheme("github_dark_default")

      vim.api.nvim_set_hl(0, "LineNr", { fg = "#6a737d" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff7b72", bold = true })
    end,
  },
}
