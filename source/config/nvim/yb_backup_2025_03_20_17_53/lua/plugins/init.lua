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


  -- {
  -- 	"NVIM-TREESITTER/NVIM-TREESITTER",
  -- 	OPTS = {
  -- 		ENSURE_INSTALLED = {
  -- 			"VIM", "LUA", "VIMDOC",
  --      "HTML", "CSS"
  -- 		},
  -- 	},
  -- },
}
