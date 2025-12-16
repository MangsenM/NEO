return {

    'nvim-telescope/telescope.nvim', tag = '0.1.8',

        dependencies = {
            'nvim-lua/plenary.nvim',
            "jvgrootveld/telescope-zoxide",
        },

    config = function ()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        local map = vim.keymap.set

telescope.setup({
            defaults = {},

            extensions = {
                zoxide = {
                    prompt_title = ""
                }
            }
        })

    telescope.load_extension("zoxide")

        map('n', '<leader>f', builtin.find_files, { desc = "Find Files" })
        map('n', '<leader>g', builtin.live_grep, { desc = "Live Grep" })
        map('n', '<leader>b', builtin.buffers, { desc = "Find Buffers" })
        map('n', '<leader>h', builtin.help_tags, { desc = "Find Help" })
        map('n', '<leader>cd', function() telescope.extensions.zoxide.list() end, { desc = "[Change Directory]" })
    end
}
