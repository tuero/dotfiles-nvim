-- Onedark
vim.api.nvim_command("set background=dark")
require('onedark').setup {
    style = 'warmer'
}
require('onedark').load()

-- Function to switch between light/dark theme
function _G.ToggleTheme()
    if(vim.api.nvim_get_var("colors_name") == "onedark") then
        -- vim.api.nvim_command("set background=light")
        -- vim.api.nvim_command("colorscheme github_light")
        vim.api.nvim_command("set background=light")
        vim.api.nvim_command("colorscheme zenbones")
        vim.g.forestbones = { solid_line_nr = true, darken_comments = 45 }
    else
        vim.api.nvim_command("set background=dark")
        vim.api.nvim_command("let g:onedark_config = { 'style': 'warmer' }")
        vim.api.nvim_command("colorscheme onedark")
    end
end

vim.keymap.set('n', '<leader>tt', ':lua ToggleTheme()<CR>', { desc = '[T]oggle [T]heme' })
