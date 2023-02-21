-------------------------------------------------------------------
-------------------------------------------------------------------

function _G.ThemeOneDark()
    vim.api.nvim_command("colorscheme default")
    vim.api.nvim_command("set background=dark")
    require('onedark').setup {
        style = 'warmer'
    }
    require('onedark').load()
    require('lualine').setup {options = { theme="auto" },}
end
function _G.ThemeZenBones()
    vim.api.nvim_command("colorscheme default")
    vim.api.nvim_command("set background=light")
    vim.api.nvim_command("colorscheme zenbones")
    vim.g.forestbones = { solid_line_nr = true, darken_comments = 45 }
    require('lualine').setup {options = { theme="auto" },}
end
function _G.ThemeGithubLight()
    vim.api.nvim_command("colorscheme default")
    vim.api.nvim_command("set background=light")
    require("github-theme").setup({
        theme_style = "light",
    })
    require('lualine').setup {options = { theme="auto" },}
end
function _G.ThemeGithubDark()
    vim.api.nvim_command("colorscheme default")
    vim.api.nvim_command("set background=dark")
    require("github-theme").setup({
        theme_style = "dark",
    })
    require('lualine').setup {options = { theme="auto" },}
end

-------------------------------------------------------------------
-------------------------------------------------------------------

vim.api.nvim_create_user_command(
  'ThemeGithubLight',
  function()
    ThemeGithubLight()
  end,
  {bang = true, desc = 'Change theme to github light'}
)
vim.api.nvim_create_user_command(
  'ThemeGithubDark',
  function()
    ThemeGithubDark()
  end,
  {bang = true, desc = 'Change theme to github dark'}
)
vim.api.nvim_create_user_command(
  'ThemeOneDark',
  function()
    ThemeOneDark()
  end,
  {bang = true, desc = 'Change theme to OneDark'}
)
vim.api.nvim_create_user_command(
  'ThemeZenBones',
  function()
    ThemeZenBones()
  end,
  {bang = true, desc = 'Change theme to ZenBones'}
)

-------------------------------------------------------------------
-------------------------------------------------------------------

ThemeOneDark()

-- Function to switch between light/dark theme
function _G.ToggleTheme()
    if(vim.api.nvim_get_var("colors_name") == "onedark") then
        ThemeZenBones()
    else
        ThemeOneDark()
    end
end

vim.keymap.set('n', '<leader>tt', ':lua ToggleTheme()<CR>', { desc = '[T]oggle [T]heme' })
