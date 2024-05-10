-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- On-Screen keylog
	use 'folke/which-key.nvim'

	-- A dependency
	use "nvim-lua/plenary.nvim"

	-- Fuzzy Finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Color Scheme
    use { 'scottmckendry/cyberdream.nvim', as = 'cyberdream' }
    use { 'folke/tokyonight.nvim', as = 'tokyonight' }

    -- Quick File Finder
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	-- File Parser
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}	

	-- Undo History
	use 'mbbill/undotree'

	-- Co-Pilot
	use 'github/copilot.vim'

	-- Git Integration
	use 'tpope/vim-fugitive'

	-- LSP Configuration
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

    -- Prettier
    use {
        'prettier/vim-prettier',
        run = 'yarn install --frozen-lockfile --production'
    }

    -- Game
    use 'ThePrimeagen/vim-be-good'
end)
