return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        lazy = false,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'williamboman/mason-lspconfig.nvim' },
        },
        opts = {
            inlay_hint = { enable = false },
        },
        config = function()
            vim.g.diagnostics_on = false
            -- function to toggle "normal" diagnostics or lsp-lines diagnostics.
            local function toggle_diagnostics()
                vim.g.diagnostics_on = not vim.g.diagnostics_on
                if vim.g.diagnostics_on then
                    vim.diagnostic.config({
                        virtual_lines = {
                            severity = {
                                min = "ERROR",
                            }
                        },

                    })
                else
                    vim.diagnostic.config({
                        virtual_lines = {
                            severity = {
                                min = "HINT",
                            }
                        },
                    })
                end
            end


            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')

            local attach = function(_, bufnr)
                local opts = { buffer = bufnr, remap = false }
                vim.lsp.inlay_hint.enable(false)


                vim.keymap.set("n", "<Leader>tw", toggle_diagnostics,
                    { desc = "Toggle Warnings", buffer = bufnr, remap = false })
                vim.keymap.set("n", "<A-f>", function() vim.lsp.buf.format() end, opts)
                vim.keymap.set("n", "ƒ", function() vim.lsp.buf.format() end, opts)
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "<Leader>d", '<cmd>Telescope lsp_document_symbols<cr>', opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
                    { buffer = bufnr, remap = false, desc = "code_action" })
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
                    { buffer = bufnr, remap = false, desc = "rename" })
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end

            local capabilities = require('blink.cmp').get_lsp_capabilities()
            lsp_zero.extend_lspconfig({
                lsp_attach = attach,
                capabilities = capabilities,
            })

            local lspc = require('lspconfig')


            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'jdtls',
                    'rust_analyzer',
                    'gopls',
                    'clangd',
                    'basedpyright',
                    'hls',
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls({
                            settings = {
                                Lua = {
                                    hint = { enable = false },
                                    vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = '#FF7F7F', italic = true })

                                }
                            }
                        })
                        lspc.lua_ls.setup(lua_opts)
                    end,
                }
            })
        end
    }
}
