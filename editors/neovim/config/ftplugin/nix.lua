vim.lsp.enable("nixd")
require("nvim-treesitter").install({ "nix" })

vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = -1
