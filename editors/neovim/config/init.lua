vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("themes.solarized")
require("plugins")

local keymaps = require("core.keymaps")

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.diagnostic.config({
	virtual_text = true,
})

keymaps.add({
	{ "<C-h>", "<Cmd>wincmd h<CR>", desc = "Go to the left window", mode = { "n", "t" } },
	{ "<C-j>", "<Cmd>wincmd j<CR>", desc = "Go to the down window", mode = { "n", "t" } },
	{ "<C-k>", "<Cmd>wincmd k<CR>", desc = "Go to the up window", mode = { "n", "t" } },
	{ "<C-l>", "<Cmd>wincmd l<CR>", desc = "Go to the right window", mode = { "n", "t" } },
	{ "<Esc>", [[<C-\><C-n>]], desc = "Switch to normal mode", mode = { "n", "t" } },
	{ ">", ">gv", desc = "Indent right", mode = "x" },
	{ "<", "<gv", desc = "Indent left", mode = "x" },
	{ "<leader>-", "<Cmd>split<CR>", desc = "Horizontally split window" },
	{ "<leader>\\", "<Cmd>vsplit<CR>", desc = "Vertically split window" },
	{ "<leader>q", "<Cmd>bp | bd #<CR>", desc = "Close current buffer" },
	{
		"<leader>F",
		function()
			vim.lsp.buf.format({ async = true })
		end,
		desc = "Format",
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		keymaps.add({
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "Lsp code actions", mode = { "n", "v" }, buffer = ev.buf },
		})

		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(event)
		if vim.bo[event.buf].buftype ~= "" then
			keymaps.add({ { "q", "<cmd>close<CR>", mode = "n", buffer = event.buf, silent = true } })
		end
	end,
})
