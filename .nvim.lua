vim.lsp.config("nixd", {
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			formatting = {
				command = { "nixfmt" },
			},
			options = {
				home_manager = {
					expr = '(builtins.getFlake (toString ./.)).homeConfigurations."huangyifei@huangyifeis-MacBook-Pro.local".options',
				},
			},
		},
	},
})
