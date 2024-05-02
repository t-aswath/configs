-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- enable mason
mason.setup()
mason_lspconfig.setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		"isort",
		"bashls",
		"black",
		"clang-format",
		"clangd",
		"cpplint",
		"cssls",
		"eslint_d",
		"html",
		"lua_ls",
		"markdownlint",
		"prettier",
		"pylint",
		"pylsp",
		"rstcheck",
		"rust_analyzer",
		"rustfmt",
		"stylua",
		"tailwindcss",
		"tsserver",
		"vimls",
	},
})
