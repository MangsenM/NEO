vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')

-- jklö MVMNT
vim.keymap.set({"n", "v", "o"}, "j", "h", {noremap = true , silent = true })
vim.keymap.set({"n", "v", "o"}, "k", "j", {noremap = true , silent = true })
vim.keymap.set({"n", "v", "o"}, "l", "k", {noremap = true , silent = true })
vim.keymap.set({"n", "v", "o"}, "ö", "l", {noremap = true , silent = true })

vim.keymap.set ({"n", "v"}, "<leader>y", [["+y]], {desc = "copy"})
