return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        {
            "neovim/nvim-lspconfig",
            config = function()

                local capabilities = require('blink.cmp').get_lsp_capabilities()

                vim.lsp.config("gopls", {
                    settings = {
                        gopls = {
                            gofumpt = true,
                            completeUnimported = true,
                            usePlaceholders = true,
                            analyses = {
                                unusedparams = true,
                                nilness = true,
                                unusedwrite = true,
                                shadow = true,
                            },
                            staticcheck = true,
                        },
                    },

                    capabilities = capabilities,
                })

                vim.lsp.config("rust_analyzer", {
                    settings = {},
                    capabilities = capabilities,
                })

            end
        }
    },
}
