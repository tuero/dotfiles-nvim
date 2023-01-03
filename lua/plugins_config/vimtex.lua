vim.g.vimtex_compiler_latexmk = { 
    options = { 
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-interaction=nonstopmode',
        '-synctex=1'
    } 
}

vim.g.vimtex_quickfix_ignore_filters = {
    'Overfull',
    'Redefining Unicode character'
}