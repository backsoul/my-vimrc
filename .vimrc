set nocompatible
set background=dark

set bg=dark
set encoding=UTF-8



packloadall

set mouse=a
let NERDTreeShowHidden=1
set expandtab        " introduce espacios al pulsar tab
set textwidth=79    " rompe las líneas al superar los 80 caracteres
set tabstop=4        " usa 4 espacios al presionar tab
set softtabstop=4
set shiftwidth=4     " numero de espacios a usar para autoindentacion
set autoindent        " Respetar automáticamente el sangrado de la línea precedente
set background=dark " esquema de color
set ruler                 " muestra el numero de línea y columna
syntax on               " resaltado de sintaxis
set showcmd          " mostrar comandos parciales en la linea de comandos
set number relativenumber           " mostrar numeros de linea
set filetype=htmldjango         " coloreado de sintaxis en las templates de django
set title       " Muestra el path del fichero

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


set laststatus=2


highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\| \+\ze\t/

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'ekalinin/Dockerfile.vim'

Plug 'dyng/ctrlsf.vim'
Plug 'voldikss/vim-browser-search'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

Plug 'SirVer/ultisnips', {'for': ['sh', 'python', 'markdown']}
Plug 'honza/vim-snippets', {'for': ['sh', 'python', 'markdown']}
Plug 'davidhalter/jedi-vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'morhetz/gruvbox'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" Initialize plugin system
call plug#end()
" Color Scheme

set termguicolors
set background=dark
syntax enable
colorscheme gruvbox

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let mapleader = ","

nnoremap <leader>s :prettier <cr> :w!<cr>

nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>e :NERDTreeToggle<cr>
nnoremap <leader>b :NERDTreeFocus<cr>
nnoremap <leader>t :split<cr>

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-t>"

autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

autocmd FileType java setlocal omnifunc=javacomplete#Complete

nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
  nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
  nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
  nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

  imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
  imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
  imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
  imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

  nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

  imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

  nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
  nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
  nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
  nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
  nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
  nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
  nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
  nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

  imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
  imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
  imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

  vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
  vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
  vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

  nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
  nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

let g:JavaComplete_EnableDefaultMappings = 0


function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
