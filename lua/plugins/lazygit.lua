return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- 依存関係（ telescope.nvimを使っている場合は、拡張機能としても使えます）
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- キーマップの設定（例：<leader>gg で起動）
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}
