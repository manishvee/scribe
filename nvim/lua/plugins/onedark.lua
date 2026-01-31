return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        require("onedarkpro").setup({
            colors = {
                onedark_vivid = { bg = "#141414" }, -- yellow
            }
        })

        vim.cmd("colorscheme onedark_vivid")
    end
}

