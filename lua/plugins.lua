return function(use)
    use { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        requires = {
        -- Automatically install LSPs to stdpath for neovim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        'j-hui/fidget.nvim',
        },
    }

    -- tresitter doesn't like python
    use 'nvie/vim-flake8'
    use { 'psf/black', brach = 'stable' }

    use { -- DAP
        "rcarriga/nvim-dap-ui", 
        requires = {"mfussenegger/nvim-dap"} 
    }

    use { -- Autocompletion
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    }

    use { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        run = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }

    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    -- Git related plugins
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'

    use 'nvim-lualine/lualine.nvim' -- Fancier statusline
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

    -- Fuzzy Finder (files, lsp, etc)
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    use({
      "folke/which-key.nvim",
        config = function()
          require("which-key").setup({})
        end
    })

    use 'ray-x/lsp_signature.nvim'
    use 'rhysd/vim-clang-format'
    use 'jiangmiao/auto-pairs'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Themes
    use 'navarasu/onedark.nvim' -- Theme inspired by Atom
    use 'projekt0n/github-nvim-theme'
    use {
        "mcchrish/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        requires = "rktjmp/lush.nvim"
    }

    -- Latex
    use 'lervag/vimtex'
    use 'preservim/vim-markdown'

    -- Snippets
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'

    -- Close buffer without messing window placement
    use 'famiu/bufdelete.nvim'

    -- Scroll bar
    use 'petertriho/nvim-scrollbar'

    -- Auto highlight all occurances of word
    use 'RRethy/vim-illuminate'

    -- Winbar
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }

    -- Highlighting current search
    use 'rktjmp/highlight-current-n.nvim'

end