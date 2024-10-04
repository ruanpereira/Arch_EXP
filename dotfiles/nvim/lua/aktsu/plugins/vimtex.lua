--- Vim Tex plugin config
            -- Compiler with latexmk pdflatex biber pdflatex2x
            -- If other methods are needed just run again after e.g. makeglossaries
            vim.g.vimtex_compiler_method = 'latexmk'
            vim.g.vimtex_parser_bib_backend = 'biber'
            vim.g.vimtex_compiler_silent = 0
            vim.g.vimtex_complete_enabled = 1
            vim.g.vimtex_fold_enabled = 0
            vim.g.vimtex_fold_bib_enabled = 1
            vim.opt.conceallevel = 2
            vim.g.vimtex_conceal_cites = 'icon'--'brackets'
            vim.g.vimtex_syntax_conceal = {
                accents = 1,
                ligatures = 1,
                cites = 1,
                fancy = 1,
                spacing = 0,
                greek = 1,
                math_bounds = 1,
                math_delimiters = 1,
                math_fracs = 1,
                math_super_sub = 1,
                math_symbols = 0,
                sections = 0,
                styles = 1,
            }
            -- Configure okular vim side
            vim.g.vimtex_view_general_viewer = 'okular'
            vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
            -- Okular side
            -- "Settings > Editor > Custom Text Editor"
            -- command: nvim --headless -c "VimtexInverseSearch %l '%f'"
            -- source: https://docs.kde.org/stable5/en/okular/okular/inverse_search.html 
            vim.g.vimtex_syntax_enabled = 0

