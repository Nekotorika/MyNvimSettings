return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  lazy = false,
  priority = 1000,
  config = function()
    local status, treesitter = pcall(require, "nvim-treesitter.configs")
    if not status then
      return
    end

    treesitter.setup({
      ensure_installed = {
        "lua", "python", "vim", "vimdoc", "bash", "sql", "json", "yaml", "toml",
        "c", "cpp", "python", "rust", "go", "javascript", "typescript", "tsx",
        "html", "css", "xml", "tex", "markdown", "markdown_inline"
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
