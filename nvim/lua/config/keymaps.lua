vim.g.mapleader = " "


-- press 'kj' to exit insert or visual mode
vim.keymap.set("i", "kj", "<Esc>", { noremap = true })
vim.keymap.set("v", "kj", "<Esc>", { noremap = true })


-- bring up the Oil file explorer in a floating window
vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open Oil in floating window"})

vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, { desc = "Format document" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>oi", function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.organizeImports" },
    },
  })
end, { desc = "Organize imports" })
