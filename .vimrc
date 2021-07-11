filetype indent plugin on
" set modeline
set background=dark

set expandtab        " introduce espacios al pulsar tab
set textwidth=79    " rompe las líneas al superar los 80 caracteres
set tabstop=4        " usa 4 espacios al presionar tab
set softtabstop=4
set shiftwidth=4     " numero de espacios a usar para autoindentacion
set autoindent        " Respetar automáticamente el sangrado de la línea precedente
set background=light  " esquema de color
set ruler                 " muestra el numero de línea y columna
syntax on               " resaltado de sintaxis
set showcmd          " mostrar comandos parciales en la linea de comandos
set number norelativenumber           " mostrar numeros de linea
set filetype=htmldjango         " coloreado de sintaxis en las templates de django
set title       " Muestra el path del fichero


" Completado de sintaxis
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\| \+\ze\t/

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" Initialize plugin system
call plug#end()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let mapleader = ","

nnoremap <leader>w w <cr>
nnoremap <leader>q wq! <cr>
nnoremap <leader>f :Files<cr>
