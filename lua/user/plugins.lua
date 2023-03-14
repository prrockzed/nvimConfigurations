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

 use { "wbthomason/packer.nvim" } -- Have packer manage itself
 use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
 use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
 --  use { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }
 --  use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
 --  use { "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" }
 --	use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
 --  use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }
 --  use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }
 --  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
 --  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
 --  use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }
 --  use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }
 --	use {"folke/which-key.nvim"}

 -- Commenting
 use { "numToStr/Comment.nvim" }
 use { "JoosepAlviste/nvim-ts-context-commentstring" }



 -- Extra Plugins
 use { "nvim-lua/popup.nvim" }  -- (Was not here originally)An implementation of the Popup Api from vim in neovim
 use { "rstacruz/vim-closer" } -- (Was not here originally)
 -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}  -- (Was not here originally)
 -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'} -- (Was not here originally)
 -- use {'andymass/vim-matchup', event = 'VimEnter'} -- (Was not here originally)





 -- Colorschemes
 use { "folke/tokyonight.nvim"}
 use { "lunarvim/darkplus.nvim"}
 use { "lunarvim/colorschemes" }
 use { "rktjmp/lush.nvim" }
 use { "metalelf0/jellybeans-nvim" }

 -- Cmp 
 use { "hrsh7th/nvim-cmp" } -- The completion plugin
 use { "hrsh7th/cmp-buffer" } -- buffer completions
 use { "hrsh7th/cmp-path" } -- path completions
 use { "hrsh7th/cmp-cmdline" } -- cmdline completions
 use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
 use { "hrsh7th/cmp-nvim-lsp" } -- lsp configuration
 use { "hrsh7th/cmp-nvim-lua" } -- lua configuration

 -- Snippets
 use { "L3MON4D3/LuaSnip", run = "make install_jsregexp" }
 use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

 -- LSP
 use { "neovim/nvim-lspconfig" } -- enable LSP
 use { "williamboman/mason.nvim" } -- simple to use language server installer
 use { "williamboman/mason-lspconfig.nvim" }
 use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
 --  use "RRethy/vim-illuminate"

 -- Telescope
 use { "nvim-telescope/telescope.nvim", tag = '0.1.1' }

 -- Treesitter
 use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
 use { "HiPhish/nvim-ts-rainbow2"} -- rainbow highlighting
 use { "nvim-treesitter/playground" }

 -- Git
 --	use { "lewis6991/gitsigns.nvim", commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" }

 --  -- Wakatime
 --  use 'wakatime/vim-wakatime'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
