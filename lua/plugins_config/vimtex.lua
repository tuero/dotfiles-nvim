vim.g.vimtex_compiler_latexmk = { 
    options = { 
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-interaction=nonstopmode',
        '-synctex=1'
    } 
}