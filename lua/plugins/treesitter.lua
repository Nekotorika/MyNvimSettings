return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" }, -- ← これ重要

  opts = {

    parser_install_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/parser",

    ensure_installed = {
      "lua", "vim", "vimdoc",
      "c", "cpp", "python", "rust", "go",
      "javascript", "typescript", "jsx", "tsx",
      "bash", "json", "yaml", "toml",
    },

    highlight = {
      enable = true,
    },
  },
}
