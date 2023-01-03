-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Quit
vim.keymap.set('n', '<leader>qq', ":q<CR>", { desc = '[qq]uit' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = '[d]iagnose [p]rev error' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = '[d]iagnose [n]ext error' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Move lines without using the clipboard
vim.keymap.set('n', '<M-k>', ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set('n', '<M-j>', ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- WhichKey 
vim.keymap.set('n', '<leader>wk', ':silent WhichKey<CR>', { desc = "List [w]hich[k]ey" })

-- C/C++ style keybinds
-- Compile
vim.keymap.set('n', '<leader>cc', function()
    if vim.bo.filetype == "cpp" or vim.bo.filetype == "cxx" then
        vim.cmd("let &makeprg = 'g++ -Wall -Wextra -std=c++20 -g -ggdb -Og %'")
        vim.cmd("make | cwindow")
    end
end, { desc = "List [c]ompile [c]ode" })
-- Switch header source
vim.keymap.set('n', '<M-o>', function()
    if vim.bo.filetype == "cpp" or vim.bo.filetype == "cxx" or vim.bo.filetype == "c" then
        vim.cmd("ClangdSwitchSourceHeader")
    end
end, { desc = "switch source header" })
-- ClangFormat
vim.keymap.set('n', '<M-F>', ':ClangFormat<CR>', { desc = "ClangFormat" })

-- Telescope
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sc', require('telescope.builtin').commands, { desc = '[s]earch [c]ommands' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[s]earch [f]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[s]earch [h]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[s]earch current [w]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[s]earch by [g]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[s]earch [d]iagnostics' })

-- DAP
-- Check if a .vscode/launch.json exists, and if so, bind it to override default configs
vim.keymap.set('n', '<F5>', function()
        if vim.fn.filereadable('.vscode/launch.json') then
            require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {"c", "cpp"} })
        end  
        require('dap').continue()
    end, { desc = 'DAP Continue' })
vim.keymap.set('n', '<F10>', require('dap').step_over, { desc = 'DAP Step Over' })
vim.keymap.set('n', '<F11>', require('dap').step_into, { desc = 'DAP Step Into' })
vim.keymap.set('n', '<F12>', require('dap').step_out, { desc = 'DAP Step Out' })
vim.keymap.set('n', '<leader>du', require('dap').up, { desc = '[d]ap Go [u]p stack' })
vim.keymap.set('n', '<leader>dd', require('dap').down, { desc = '[d]ap Go [d]own stack' })
vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint, { desc = '[d]ap [b]reakpoint toggle' })
vim.keymap.set('n', '<leader>dB', function()
        require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end, { desc = '[dab] [B]reakpoint set' })
vim.keymap.set('n', '<leader>dr', require('dap').repl.open, { desc = '[d]ap [r]epl open' })