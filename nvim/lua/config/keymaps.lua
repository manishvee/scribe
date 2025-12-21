vim.g.mapleader = " "


-- press 'kj' to exit insert or visual mode
vim.keymap.set("i", "kj", "<Esc>", { noremap = true })
vim.keymap.set("v", "kj", "<Esc>", { noremap = true })


-- bring up the Oil file explorer in a floating window
vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open Oil in floating window"})

-- lsp keymaps
vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, { desc = "Format document" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Open code actions" })
vim.keymap.set("n", "<leader>oi", function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { "source.organizeImports" },
    },
  })
end, { desc = "Organize imports" })


-- Shift + Tab unindents a line
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true })


-- manage screen splits
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Previous split"})
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Next split"})

-- Buffer management
vim.keymap.set("n", "<leader>tx", "<cmd>bdelete<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>tl", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>th", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
