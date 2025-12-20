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
                    },
                    staticcheck = true,
                },
            }
        })
        vim.lsp.enable({
            "rust_analyzer",
            "gopls",
        })
    end
}
