-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	use("catppuccin/nvim")

	-- discord
	use("andweeb/presence.nvim")

	-- essential plugins
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") --maximizes and restores current window

	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)

	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	use("numToStr/Comment.nvim") -- commenting with gcc

	use("nvim-tree/nvim-tree.lua")

	-- use("mbbill/undotree")

	use("nvim-tree/nvim-web-devicons") -- vs-code like icons

	use("lukas-reineke/indent-blankline.nvim")

	-- fuzzy finding w/ telescope
	use("nvim-telescope/telescope.nvim") -- fuzzy finder

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance

	--	 autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system path

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
	use("WhoIsSethDaniel/mason-tool-installer.nvim")

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("stevearc/conform.nvim")
	use("mfussenegger/nvim-lint")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		-- run = function()
		-- 	local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		-- 	ts_update()
		-- end,
	})

	-- rust
	use("simrat39/rust-tools.nvim")

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	use("norcalli/nvim-colorizer.lua") -- colorizer

	use("sudoerwx/vim-ray-so-beautiful") -- screenshot

	use("ThePrimeagen/harpoon") -- harpoon

	-- use("ThePrimeagen/vim-be-good")

	-- use("karb94/neoscroll.nvim")

	use("github/copilot.vim")

	-- use({ "michaelb/sniprun", run = "sh ./install.sh" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
