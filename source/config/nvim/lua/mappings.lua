require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", "<C-a>", "ggVG")
map("n", "<leader>ff", "<cmd> Telescope <cr>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map ("n","L", "$")
map ("n","H", "^")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- map({"n","v"}, "f", "<plug>(leap-anywhere)")

