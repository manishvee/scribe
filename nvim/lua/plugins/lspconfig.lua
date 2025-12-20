return {
    "neovim/nvim-lspconfig",
    config = function()
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
            }
        })

        vim.lsp.config("rust_analyzer", {})

        vim.lsp.enable({
            "rust_analyzer",
            "gopls",
        })
    end
}
