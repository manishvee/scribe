return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    keys = {
        -- Grep
        { "<leader>sf", function() Snacks.picker.grep() end, desc = "Grep files" },
        { "<leader>sl", function() Snacks.picker.lines() end, desc = "Grep lines" },
        -- find
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find Buffers" },
        -- git
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
        -- Miscellaneous
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
        { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
        { '<leader>sr', function() Snacks.picker.registers() end, desc = "Registers" },
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
        -- LSP
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        -- Other
        { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
        { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    },
    opts = {
        dashboard = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        picker = {
            enabled = true,
            win = {
                -- input window
                input = {
                    keys = {
                        ["<Esc>"] = { "close", mode = { "n", "i" } },
                        ["<leader>t"] = { "tab", mode = { "n", "i" } },
                        ["<leader>v"] = { "edit_vsplit", mode = { "i", "n" } },
                        ["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
                        ["{"] = { "preview_scroll_up", mode = { "n" } },
                        ["}"] = { "preview_scroll_down", mode = { "n" } },
                        ["q"] = "cancel",
                    },
                },
            },
        },
        scope = { enabled = true },
        scroll = { enabled = true },
        indent = {
            enabled = false,
            animate = { enabled = false },
        },
        statuscolumn = { enabled = true },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                Snacks.toggle.indent():map("<leader>ug")
            end,
        })
    end,
}
