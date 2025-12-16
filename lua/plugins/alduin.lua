return {
    "bakageddy/alduin.nvim",
    priority = 1000,
    config = true,

    opts = {
        terminal_colors = true,
        inverse = true,
        palette_overrides = {},
        overrides = {},
    },

    init = function()
        vim.cmd.colorscheme "alduin"
        vim.api.nvim_set_hl(0, 'HarpoonActive', { fg = '#1c1c1c', bg = '#8b5f61', underline = false, bold = true })
        vim.api.nvim_set_hl(0, 'HarpoonNumberActive', { fg = '#1c1c1c', bg = '#8b5f61', underline = false, bold = true })
        vim.api.nvim_set_hl(0, 'HarpoonInactive', { fg = '#1c1c1c', bg = '#af8787', underline = false })
        vim.api.nvim_set_hl(0, 'HarpoonNumberInactive', { fg = '#1c1c1c', bg = '#af8787', underline = false })
        vim.api.nvim_set_hl(0, 'MatchParen', { fg = '#FFFFFF', bg = '#8B4513', underline = false })
    end,
}
