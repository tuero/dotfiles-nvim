if vim.g.vscode then
    -- Set <space> as the leader key
    -- See `:help mapleader`
    --  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
    vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '

    -- Remap for dealing with word wrap
    -- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
    -- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

    -- System standard bindings
    vim.keymap.set('n', '<leader>w', ":Write<CR>", { desc = '[w]rite' })
    vim.keymap.set('n', '<leader>sf', ":Ex<CR>", { desc = '[E]xit' })
    vim.keymap.set('n', '<leader>qw', ":Quit<CR>", { desc = '[q]uit [w]indow' })
    vim.keymap.set('n', '<leader>qp', "<Cmd>call VSCodeNotify('workbench.action.closePanel')<CR>", { desc = '[q]uit [p]anel' })
    vim.keymap.set('n', '<leader>dn', "<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>", { desc = '[d]iagnose error [n]ext' })
    vim.keymap.set('x', 'gc', "<Plug>VSCodeCommentarygv", { desc = 'g[c]omment' })
    vim.keymap.set('o', 'gc', "<Plug>VSCodeCommentarygv", { desc = 'g[c]omment' })
    vim.keymap.set('n', 'gcc', "<Plug>VSCodeCommentaryLinegv", { desc = 'g[cc]omment line' })
    vim.keymap.set('n', '<leader>cc', "<Cmd>call VSCodeNotify('code-runner.run')<CR>", { desc = '[cc]ompile' })

    vim.keymap.set('n', '<C-w>p', "<Cmd>call VSCodeNotify('workbench.action.focusPanel')<CR>", { desc = '[w]indow focus [p]anel' })
    vim.keymap.set('n', '<C-w>l', "<Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>", { desc = '[w]indow focus right' })
    vim.keymap.set('n', '<C-w>h', "<Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>", { desc = '[w]indow focus left' })
    vim.keymap.set('n', '<leader><leader>', "<Cmd>call VSCodeNotify('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup')<CR>", { desc = '[w]indow focus left' })
    -- vim.keymap.set('n', '<leader><leader>', "<Cmd>call VSCodeNotify('workbench.action.quickOpenNavigateNextInEditorPicker')<CR>", { desc = '[w]indow focus left' })
    -- vim.keymap.set('n', '<C-w>e', "<Cmd>call VSCodeNotify('workbench.action.focusActiveEditorGroup')<CR>", { desc = '[w]indow focus active [e]ditor' })

    -- Move lines without using the clipboard
    vim.keymap.set('n', '<M-k>', ":m .-2<CR>==", { noremap = true, silent = true })
    vim.keymap.set('n', '<M-j>', ":m .+1<CR>==", { noremap = true, silent = true })
    vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
    vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
    vim.keymap.set('v', '<', "<gv", { noremap = true, silent = true })
    vim.keymap.set('v', '>', ">gv", { noremap = true, silent = true })
else
-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Add custom plugins to packer from ~/.config/nvim/lua/plugins.lua
    local has_plugins, plugins = pcall(require, 'plugins')
    if has_plugins then
        plugins(use)
    end

    if is_bootstrap then
        require('packer').sync()
    end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})

-- General settings
require('general')

-- Plugin configs
require('plugin_config_include')

-- Non-plugin related keybinds
require('keybinds')

-- Themes
require('themes')

end
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
