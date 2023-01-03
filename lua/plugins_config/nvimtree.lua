-- nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Show untracked files (useful for project experiments)
require("nvim-tree").setup{
    git = {
        enable = true,
        ignore = false,
        timeout = 400,
    }
}

-- Toggle side panel
vim.api.nvim_set_keymap('n', '<F8>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
