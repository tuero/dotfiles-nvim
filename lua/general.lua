-- [[ Setting options ]]
-- See `:help vim.o`

-- Enable unicode
vim.opt.encoding="utf-8"

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
-- vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Automatically open quickfix qindow after :make or other quickfix-related commands, when valid errors
vim.api.nvim_command([[ autocmd QuickFixCmdPost [^l]* nested cwindow ]])
vim.api.nvim_command([[ autocmd QuickFixCmdPost l* nested lwindow ]])

vim.api.nvim_command([[ au BufNewFile,BufRead *.cu set ft=cuda ]])
vim.api.nvim_command([[ au BufNewFile,BufRead *.cuh set ft=cuda ]])

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})