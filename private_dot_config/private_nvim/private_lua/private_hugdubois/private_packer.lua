-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
      "nvim-telescope/telescope.nvim", tag = "0.1.0",
      -- or                            , branch = "0.1.x",
      requires = { {"nvim-lua/plenary.nvim"} }
  })
  use({"nvim-telescope/telescope-symbols.nvim"})
  -- use({
  --     "rose-pine/neovim",
  --     as = "rose-pine",
  --     config = function()
  --         vim.cmd("colorscheme rose-pine")
  --     end
  -- })
  --
  use({
      "Mofiqul/dracula.nvim",
      as = "dracula",
      config = function()
          vim.cmd("colorscheme dracula")
      end
  })

  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })

  use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
          local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
          ts_update()
      end,
  })

  use("nvim-treesitter/playground")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")
  use("nvim-treesitter/nvim-treesitter-context");

  use({
	  "VonHeikemen/lsp-zero.nvim",
	  branch = "v1.x",
	  requires = {
		  -- LSP Support
		  {"neovim/nvim-lspconfig"},
		  {"williamboman/mason.nvim"},
		  {"williamboman/mason-lspconfig.nvim"},

		  -- Autocompletion
		  {"hrsh7th/nvim-cmp"},
		  {"hrsh7th/cmp-buffer"},
		  {"hrsh7th/cmp-path"},
		  {"saadparwaiz1/cmp_luasnip"},
		  {"hrsh7th/cmp-nvim-lsp"},
		  {"hrsh7th/cmp-nvim-lua"},

		  -- Snippets
		  {"L3MON4D3/LuaSnip"},
		  {"rafamadriz/friendly-snippets"},
	  }
  })
  use({
	  "jose-elias-alvarez/null-ls.nvim",
	  requires = { {"nvim-lua/plenary.nvim"} }
  })
  use("folke/zen-mode.nvim")
  use("github/copilot.vim")

  use("ray-x/go.nvim")
  use("ray-x/guihua.lua")
  -- use("jeniasaigak/goplay.nvim")

  use("terrortylor/nvim-comment")
  use("alexghergh/nvim-tmux-navigation")

  use("vimwiki/vimwiki")
  use("vifm/vifm.vim")

  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")
  use("nvim-telescope/telescope-dap.nvim")
  -- use("c0r73x/neotags.lua")
  use("majutsushi/tagbar")
  -- use("simrat39/symbols-outline.nvim")
end)
