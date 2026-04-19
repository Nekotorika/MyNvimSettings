return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    local toggleterm = require("toggleterm")
    local Terminal = require("toggleterm.terminal").Terminal

    -- ========================================
    -- 基本設定（1回だけ）
    -- ========================================
    toggleterm.setup({
      direction = "float",
      start_in_insert = true,
      shade_terminals = false,
      float_opts = {
        border = "rounded",
        width = math.floor(vim.o.columns * 0.9),
        height = math.floor(vim.o.lines * 0.9),
      },
    })

    -- ========================================
    -- LazyGit（最適化版）
    -- ========================================
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      close_on_exit = true,
      float_opts = {
        border = "rounded",
        width = math.floor(vim.o.columns * 0.9),
        height = math.floor(vim.o.lines * 0.9),
        row = math.floor((vim.o.lines - vim.o.lines * 0.9) / 2),
        col = math.floor((vim.o.columns - vim.o.columns * 0.9) / 2),
      },
      on_open = function(term)
        vim.cmd("startinsert")

        -- 初回リフレッシュ（描画バグ対策）
        vim.defer_fn(function()
          vim.api.nvim_chan_send(term.job_id, "r")
        end, 50)
      end,
    })

    -- ========================================
    -- ノーマルキーマップ
    -- ========================================
    vim.keymap.set("n", "<leader>oo", "<cmd>ToggleTerm<cr>", { desc = "Terminal" })

    vim.keymap.set("n", "<leader>gg", function()
      lazygit:toggle()
    end, { desc = "LazyGit" })

    -- ========================================
    -- ターミナル専用キーマップ
    -- ========================================
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        local opts = { buffer = 0 }

        -- insert → normal
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)

        -- ★ 統一UX：qで閉じる
        vim.keymap.set("n", "q", "<cmd>close<cr>", opts)

        -- トグル（残すけど補助）
        vim.keymap.set("t", "<leader>oo", [[<C-\><C-n><cmd>ToggleTerm<cr>]], opts)

        vim.keymap.set("t", "<leader>gg", function()
          lazygit:toggle()
        end, opts)
      end,
    })
  end,
}
