require("formatter").setup({
	logging = false,
	filetype = {
		python = {
			function()
				return {
					exe = "black",
					args = {},
					stdin = false,
				}
			end,
		},
		json = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
					stdin = true,
				}
			end,
		},
		yaml = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
					stdin = true,
				}
			end,
		},
		css = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
					stdin = true,
				}
			end,
		},
		html = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
					stdin = true,
				}
			end,
		},
		typescript = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
					stdin = true,
				}
			end,
		},
		javascript = {
			-- prettier
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
					stdin = true,
				}
			end,
		},
		rust = {
			-- Rustfmt
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout" },
					stdin = true,
				}
			end,
		},
		lua = {
			-- luafmt
			function()
				return {
					exe = "stylua",
					args = { "-s -" },
					stdin = true,
				}
			end,
		},
		cpp = {
			function()
				return {
					exe = "clang-format",
					args = { "-style='{IndentWidth: 4}'" },
					stdin = true,
					cwd = vim.fn.expand("%:p:h"),
				}
			end,
		},
		c = {
			function()
				return {
					exe = "clang-format",
					args = { "-style='{IndentWidth: 4}'" },
					stdin = true,
					cwd = vim.fn.expand("%:p:h"),
				}
			end,
		},
	},
})

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py,*.c,*.cpp,*.css,*.html,*.js,*.jsx,*.ts,*.tsx,*.rs,*.lua FormatWrite
augroup END
]],
	true
)
