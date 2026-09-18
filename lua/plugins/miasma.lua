return {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
        vim.cmd("colorscheme miasma")
        vim.api.nvim_set_hl(0, 'HarpoonActive', { fg = '#d7c483', bg = '#222222', underline = false, bold = true })
        vim.api.nvim_set_hl(0, 'HarpoonNumberActive', { fg = '#d7c483', bg = '#222222', underline = false, bold = true })
        vim.api.nvim_set_hl(0, 'HarpoonInactive', { fg = '#666666', bg = '#222222', underline = false })
        vim.api.nvim_set_hl(0, 'HarpoonNumberInactive', { fg = '#666666', bg = '#222222', underline = false })
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#666666", bg = "#222222" })
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#666666" })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#666666" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#222222", bg = "#666666" })
        vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#685742", bg = "#222222" })
        vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#78824b", bg = "#222222" })
        vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#5f875f", bg = "#222222" })
        vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#222222" })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })
        vim.api.nvim_set_hl(0, "SignColumn", { fg = "#666666", bg = "#222222" })
    end,
}
