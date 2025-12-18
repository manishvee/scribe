return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            theme = 'everforest',
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'lsp_status', 'fileformat', 'filetype'},
                lualine_y = {'filesize'},
                lualine_z = {'location'}
            },
        }
    },
    {
       'nvim-tree/nvim-web-devicons',
       opts = {},
    }
}
