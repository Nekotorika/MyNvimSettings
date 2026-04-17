return {
  -- 1. Telescopeの設定
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "kdheepak/lazygit.nvim", -- 依存関係に入れておくとロード順が確実です
    },
    config = function()
      require("telescope").setup({
        defaults = {},
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          -- lazygit用の拡張設定（必要であればここに記述）
        },
      })

      -- 拡張機能のロード
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("lazygit")

      -- キーマップ
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

      -- Lazygit連携用のキーマップ
      vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
      vim.keymap.set("n", "<leader>gl", "<cmd>Telescope lazygit<cr>", { desc = "Telescope LazyGit (Repos)" })
    end,
  },

  -- 2. Lazygit本体の設定（個別に分けておくと管理しやすいです）
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
