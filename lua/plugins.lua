	-- require("mason").setup()
	-- require ("mason-lspconfig").setup()
	-- require("lspconfig").lua_ls.setup {}
	-- require("lspconfig").rust_analyzer.setup {}
	-- require("lspconfig").ts_ls.setup {}

	-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
	-- Regenerate compiled loader file
	-- :PackerCompile

	-- Remove any disabled or unused plugins
	--:PackerClean

	-- Clean, then install missing plugins
	-- :PackerInstall

	-- Clean, then update and install plugins
	-- supports the `--preview` flag as an optional first argument to preview updates
	-- :PackerUpdate

	-- Perform `PackerUpdate` and then `PackerCompile`
	-- supports the `--preview` flag as an optional first argument to preview updates
	-- :PackerSync

	-- Show list of installed plugins
	-- :PackerStatus

	-- Loads opt plugin immediately
	-- :PackerLoad completion-nvim ale

	return require('packer').startup(function(use)
	-- Lazy loading:
  	-- Load on specific commands
  	use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
	-- Load on an autocommand event
  	use {'andymass/vim-matchup', event = 'VimEnter'}
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Simple plugins can be specified as strings
	use 'rstacruz/vim-closer'
	-- Load on a combination of conditions: specific filetypes or commands
  	-- Also run code after load (see the "config" key)
	-- telescope
	use {'nvim-telescope/telescope.nvim', tag = '0.1.8', -- or, branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
        }

	use {
    	'w0rp/ale',
    	ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    	cmd = 'ALEEnable',
    	config = 'vim.cmd[[ALEEnable]]'
	 }
	-- Plugins can also depend on rocks from luarocks.org:
	use {'wbthomason/packer.nvim', opt = true, rocks = {'lua-cjson', 'httpclient'}}

	-- :Mason
	use {
        "williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	}
	use {
   	'wbthomason/packer.nvim', -- Packer manages itself
    	'neovim/nvim-lspconfig',
    	'hrsh7th/cmp-nvim-lsp',
    	'hrsh7th/cmp-buffer',
    	'hrsh7th/cmp-path',
    	'hrsh7th/cmp-cmdline',
    	'hrsh7th/nvim-cmp',
    	'hrsh7th/cmp-vsnip',
    	'hrsh7th/vim-vsnip',
  }

  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate' -- Automatically updates Treesitter parsers after install
  }
	end)
