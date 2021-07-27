require("lspconfig").pyright.setup({
	on_attach = my_custom_on_attach,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})
