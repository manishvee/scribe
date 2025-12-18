return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            columns = {
                "icon",
                "size",
                "mtime",
            },
            keymaps = {
                ["<leader>v"] = { "actions.select", opts = { vertical = true } },
                ["<leader>t"] = { "actions.select", opts = { tab = true } },
                ["q"] = { "actions.close", mode = "n" },
                ["r"] = "actions.refresh",
            },
            -- Skip the confirmation popup for simple operations
            skip_confirm_for_simple_edits = true,
            -- Constrain the cursor to the editable parts of the oil buffer
            -- Set to `false` to disable, or "name" to keep it on the file names
            constrain_cursor = "name",
            view_options = {
                -- Show files and directories that start with "."
                show_hidden = true,
            },
            -- Configuration for the floating window in oil.open_float
            float = {
                -- Padding around the floating window
                padding = 10,
                -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                max_width = 0.6,
                max_height = 0.8,
                border = "rounded",
                win_options = {
                    -- sets the transparency of the floating window. values from 0 to 100
                    winblend = 40,
                },
            },
            -- Configuration for the file preview window
            preview_win = {
                -- Window-local options to use for preview window buffers
                win_options = {
                    -- sets the transparency of the floating window. values from 0 to 100
                    winblend = 40,
                },
            },
            -- Configuration for the floating action confirmation window
            confirmation = {
                border = "rounded",
                win_options = {
                    winblend = 40,
                },
            },
            -- Configuration for the floating progress window
            progress = {
                border = "rounded",
                win_options = {
                    winblend = 40,
                },
            },
        },
        lazy = false, 
        init = function()
            -- mark netrw as loaded so it's not loaded at all.
            vim.g.loaded_netrwPlugin = 1
        end,
    },
    {
        "benomahony/oil-git.nvim",
        dependencies = { "stevearc/oil.nvim" },
        opts = {},
    },
}
