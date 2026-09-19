vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("plugins")

require("languages")

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.diagnostic.config({
	virtual_text = true,
})

vim.keymap.set({ "n", "t" }, "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Go to the left window" })
vim.keymap.set({ "n", "t" }, "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Go to the down window" })
vim.keymap.set({ "n", "t" }, "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Go to the up window" })
vim.keymap.set({ "n", "t" }, "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Go to the right window" })
vim.keymap.set({ "n", "t" }, "<Esc>", [[<C-\><C-n>]], { desc = "Switch to normal mode" })

vim.keymap.set("x", ">", ">gv", { desc = "Indent right" })
vim.keymap.set("x", "<", "<gv", { desc = "Indent left " })

vim.keymap.set("n", "<leader>-", "<Cmd>split<CR>", { desc = "Horizontally split window" })
vim.keymap.set("n", "<leader>\\", "<Cmd>vsplit<CR>", { desc = "Vertically split window" })

vim.keymap.set("n", "<leader>q", "<Cmd>bp | bd #<CR>", { desc = "Close current buffer" })

vim.keymap.set("n", "<leader>F", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format" })
