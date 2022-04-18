call plug#begin('~/.nvim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'lervag/vimtex'
    Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

set nobackup
set nowritebackup
set noswapfile
set updatetime=300
set cmdheight=1
set signcolumn=yes
set number
set expandtab
set tabstop=4
set shiftwidth=4
set wrap lbr
syntax on
colorscheme onedark

filetype plugin indent on
set makeprg=buldr

" COC

let g:coc_global_extensions=[
    \ 'coc-prettier',
    \ 'coc-rust-analyzer',
    \ 'coc-json',
    \ 'coc-toml',
    \ 'coc-ccls',
    \ 'coc-yaml',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-zig']

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? '\<C-p>' : '\<C-h>'

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
    \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)
xmap <leader>a v<Plug>(coc-codeaction-selected)
nmap <leader>a v<Plug>(coc-codeaction-selected)

nmap <C-m> :make<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')

" NERDTREE

noremap <C-n> :NERDTreeToggle<CR>

" AIRLINE

let g:airline_theme='deus'
let NERDTreeShowHidden=1

" FZF

noremap <C-p> :Files<CR>
noremap <leader>d :Rg<CR>
inoremap <Esc> <Esc><Esc>
