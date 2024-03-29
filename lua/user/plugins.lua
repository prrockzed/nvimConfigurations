local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "nvim-tree/nvim-tree.lua" })
	use({ "nvim-tree/nvim-web-devicons" })
	use({ "akinsho/bufferline.nvim" })
	use({ "moll/vim-bbye" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "goolord/alpha-nvim" })
	use({ "folke/which-key.nvim" })
	use({ "edluffy/specs.nvim" }) -- Cursor Navigation
	use({ "echasnovski/mini.nvim" }) -- Mini animation of Cursor
	use({ "mattn/emmet-vim" })
	use({ "alvan/vim-closetag" })
	use({ "tpope/vim-fugitive" })
	use({
		"aurum77/live-server.nvim",
		run = function()
			require("live_server.util").install()
		end,
		cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	})
	use({ "ap/vim-css-color" })
	-- use({ "vimwiki/vimwiki" })
	use({ "lalitmee/browse.nvim" })
	use({ "RishabhRD/nvim-cheat.sh" })
	use({ "RishabhRD/popfix" })
	-- use({
	-- 	"jackMort/ChatGPT.nvim",
	-- 	config = function()
	-- 		require("chatgpt").setup({
	-- 			-- optional configuration
	-- 		})
	-- 	end,
	-- 	requires = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- })

	-- Commenting
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })

	-- Extra Plugins
	use({ "nvim-lua/popup.nvim" }) -- (Was not here originally)An implementation of the Popup Api from vim in neovim
	use({ "rstacruz/vim-closer" }) -- (Was not here originally)
	-- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}  -- (Was not here originally)
	-- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'} -- (Was not here originally)
	-- use {'andymass/vim-matchup', event = 'VimEnter'} -- (Was not here originally)

	-- Colorschemes
	use({ "folke/tokyonight.nvim" })
	use({ "lunarvim/darkplus.nvim" })
	use({ "lunarvim/colorschemes" })
	use({ "rktjmp/lush.nvim" })
	use({ "metalelf0/jellybeans-nvim" })
	use({ "EdenEast/nightfox.nvim" }) -- Packer
	use({ "navarasu/onedark.nvim" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "AlexvZyl/nordic.nvim" })
	use({ "bluz71/vim-nightfly-colors", as = "nightfly" })

	-- Cmp
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "hrsh7th/cmp-cmdline" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" }) -- lsp configuration
	use({ "hrsh7th/cmp-nvim-lua" }) -- lua configuration

	-- Snippets
	use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/mason.nvim" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.1" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "HiPhish/nvim-ts-rainbow2" }) -- rainbow highlighting
	use({ "nvim-treesitter/playground" })

	-- Competitive Programming
	use({
		"xeluxee/competitest.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = function()
			require("competitest").setup()
		end,
	})

	-- Run a task
	use({ "CRAG666/betterTerm.nvim" })
	use({ "CRAG666/code_runner.nvim" })

	-- AI Autocompletion for neovim
	use({ "github/copilot.vim" })
	-- use({ "Exafunction/codeium.vim" }) -- codeium

	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	-- Wakatime
	use({ "wakatime/vim-wakatime" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
