local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt" },
	},
	format_on_save = {
		lsp_fallback = false,
		async = false,
		timeout_ms = 500,
	},
})

vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	conform.format({
		lsp_fallback = false,
		async = false,
		timeout_ms = 5000,
	})
end, { desc = "Format file or range (in visual mode)" })
