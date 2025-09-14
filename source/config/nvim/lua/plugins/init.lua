return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

    "williamboman/mason.nvim",
  {
    "williamboman/mason-lspconfig.nvim",
    ensure_installed = { "lua_ls", "pyright" }, -- Ensure these servers are installed
    automatic_installation = true,
  },
    -- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",
     config = function()
        require "configs.lspconfig"
     end,
  },

{
  "ggandor/leap.nvim",
  keys = {
    { "f", mode = { "n", "x", "o" }, desc = "Leap bidirectional" },
  },
  config = function(_, opts)
    local leap = require("leap")
    for k, v in pairs(opts) do
      leap.opts[k] = v
    end
    -- 绑定 f 为双向跳转并在跳转后居中
    vim.keymap.set({ "n", "x", "o" }, "f", function()
      leap.leap { target_windows = { vim.fn.win_getid() } }
      -- 延迟到跳转完成后执行居中
      vim.schedule(function()
        vim.cmd("normal! zz")
      end)
    end, { desc = "Leap bidirectional + center" })
  end,
}
,

  {
  "nvim-treesitter/nvim-treesitter", -- 插件仓库地址
  opts = { -- 使用 'opts' 而不是大写的 'OPTS'
    ensure_installed = { -- 使用小写的 'ensure_installed'
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css"
    },
  },
},

}
