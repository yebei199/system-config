return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
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
    { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
    { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
    { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
  },
  config = function(_, opts)
    local leap = require("leap")
    for k, v in pairs(opts) do
      leap.opts[k] = v
    end
    -- leap.create_default_mappings(false)
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
