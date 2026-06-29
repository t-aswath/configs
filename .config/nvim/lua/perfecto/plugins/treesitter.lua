return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	dependencies = {},
	config = function()
		-- Enable highlighting and indentation for all filetypes via treesitter
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local ok = pcall(vim.treesitter.start)
				if ok then
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})

		vim.treesitter.language.register("bash", "zsh")

		-- Incremental selection using native treesitter
		vim.keymap.set("n", "<C-space>", function()
			vim.cmd("normal! viw")
		end, { desc = "Start treesitter selection" })
	end,
}
