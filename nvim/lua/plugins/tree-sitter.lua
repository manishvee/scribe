return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "master",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.install").prefer_git = true

        require 'nvim-treesitter.configs'.setup {
            auto_install = true,
            ensure_installed = {
                "dockerfile", "go", "python", "rust", "sql",
            },
            indent = { enable = true },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end,
}
