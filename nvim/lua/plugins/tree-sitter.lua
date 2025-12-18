return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "master",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.install").prefer_git = true
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "csv", "dockerfile", "go", "html", "lua", "python", "rust", "sql",
            },
            auto_install = false,
            indent = { enable = true },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end,
}
