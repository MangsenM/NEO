-- write
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', {desc = "[w]rite"})

-- jklö MVMNT
vim.keymap.set({"n", "v", "o"}, "j", "h", {noremap = true , silent = true })
vim.keymap.set({"n", "v", "o"}, "k", "j", {noremap = true , silent = true })
vim.keymap.set({"n", "v", "o"}, "l", "k", {noremap = true , silent = true })
vim.keymap.set({"n", "v", "o"}, "ö", "l", {noremap = true , silent = true })

-- copy to mainclip
vim.keymap.set ({"n", "v"}, "<leader>y", [["+y]], {desc = "copy+"})

-- move to end/start of line
vim.keymap.set ({"n", "v"}, "<c-ä>", "$", {noremap = true, silent = true})
vim.keymap.set ({"n", "v"}, "<c-å>", "0", {noremap = true, silent = true})
