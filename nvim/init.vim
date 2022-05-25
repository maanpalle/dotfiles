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
    Plug 'wfxr/minimap.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'NoahTheDuke/vim-just'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'ziglang/zig.vim'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'jlcrochet/vim-cs'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'isti115/agda.nvim'
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

set termguicolors
colorscheme monokai_pro

filetype plugin indent on
set makeprg=buldr

autocmd BufNewFile,BufRead *.dodo setfiletype dodo 

" Haskell highlighting

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1

" COC

let g:coc_global_extensions=[
    \ 'coc-prettier',
    \ 'coc-rust-analyzer',
    \ 'coc-json',
    \ 'coc-toml',
    \ 'coc-ccls',
    \ 'coc-yaml',
    \ 'coc-tsserver',
    \ 'coc-html']

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
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   {'options': '--delimiter : --nth 4..'}, <bang>0)
noremap <leader>d :Rg<CR>
inoremap <Esc> <Esc><Esc>

au BufRead,BufNewFile *.dodo set filetype=dodo
