-- ========================
-- 1. 安装 lazy.nvim（如果尚未安装）
-- ========================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 最新稳定版
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ========================
-- 2. 配置插件
-- ========================

require("lazy").setup({
  -- vim-surround 功能：快速添加/删除/替换括号、引号等
  {
    "tpope/vim-surround",
    -- 不需要额外配置，直接可用
  },

  -- Leap.nvim：快速跳转插件（f/F 类似功能）
  {
    "ggandor/leap.nvim",
    config = function()
      -- 启用默认映射（s, S 等）
      require('leap').add_default_mappings()

      -- 自定义 f/F 映射，跳转后自动 zz 居中
      vim.keymap.set('n', 'f', function()
        require('leap').leap {
          target_chars = { vim.fn.input('Jump to: ') },
          on_done = function() vim.cmd('zz') end
        }
      end, { desc = "Leap forward and center" })

      vim.keymap.set('n', 'F', function()
        require('leap').leap {
          target_chars = { vim.fn.input('Jump to: ') },
          backward = true,
          on_done = function() vim.cmd('zz') end
        }
      end, { desc = "Leap backward and center" })
    end,
  },
})

-- ========================
-- 3. 基本设置 (vim.opt)
-- ========================

vim.opt.number = true              -- 显示行号
vim.opt.relativenumber = true      -- 相对行号
vim.opt.incsearch = true           -- 搜索时实时预览
vim.opt.ignorecase = true          -- 搜索忽略大小写
vim.opt.smartcase = true           -- 如果搜索词含大写，则区分大小写
vim.opt.clipboard = "unnamedplus"  -- 使用系统剪贴板（Linux/macOS）
vim.opt.mapleader = " "            -- 设置 leader 键为空格

-- ========================
-- 4. 键位映射 (vim.keymap.set)
-- ========================

-- H 和 L 跳转到行首行尾
vim.keymap.set('n', 'H', '^', { desc = "Go to line start" })
vim.keymap.set('n', 'L', '$', { desc = "Go to line end" })

-- Ctrl-a: 全选（GVgg）
vim.keymap.set('n', '<C-a>', 'GVgg', { desc = "Select all" })

-- Ctrl-c: 复制（yank）
vim.keymap.set('n', '<C-c>', 'y', { desc = "Yank (copy)" })

-- Ctrl-v: 粘贴（put）
vim.keymap.set('n', '<C-v>', 'p', { desc = "Paste" })

-- 注意：在终端中 Ctrl-v 可能被终端捕获，建议在 GUI（如 Neovide）或改用其他键
