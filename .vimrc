call plug#begin()
Plug 'vim-ruby/vim-ruby'
Plug 'cakebaker/scss-syntax.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'matze/vim-move'
Plug 'tpope/vim-fugitive'
Plug 'fneu/breezy'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'junegunn/gv.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-haml'
Plug 'brigade/scss-lint'
Plug 'rakr/vim-one'
Plug 'isruslan/vim-es6'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-emoji'
call plug#end()

" ------------- key map setting ------------------- 
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>w :w<CR>
map      <leader>q :q<CR>
map      <leader>a :Ag<CR>
vmap     <leader>e "*y
nnoremap <leader>sr :source ~/.vimrc<CR>
inoremap jj <Esc>
nnoremap n nzzzv
nnoremap N Nzzzv
noremap  <leader>/ :Commentary<CR>
noremap  <leader>find :FZF<CR>
noremap  <S-w> <C-w>
nnoremap <CR> i<CR><Esc>
nnoremap <Space> i<Space><Esc>
noremap  <silent><leader>r :RRB<CR>
nnoremap Q <Nop>
nnoremap L <s-$>
inoremap <silent> <c-h> <esc>I
inoremap <silent> <c-l> <esc>A
vnoremap L <s-$>
nnoremap H <s-^>
vnoremap H <s-^>
nnoremap <leader>o o<Esc>
nnoremap <leader>tab <c-w><s-t>
vnoremap <leader>o o<Esc>
vnoremap q <Esc>
" nnoremap ; :

" save file
vmap <C-s> :w<CR>
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>i

" emmet
imap <silent> <c-@> <c-y>,
imap <silent> <c-Space> <c-y>,

" fugit
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

" vim-test 
nmap <leader>ttn :TestNearest<CR>
nmap <leader>ttf :TestFile<CR>
nmap <leader>tts :TestSuite<CR>

" ale
nnoremap <leader>fix :ALEFix<CR>

" ctag 
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" jump cursor

nnoremap <leader>jtc `.
nnoremap <leader>jtl ``
nnoremap <leader>jti `^

" progamming shortcut
nnoremap <leader>bp orequire "pry"; binding.pry<esc>

" ----------------------------------------------------

" ---------- custom commands -------------------------

command W w
command Q q
command WQ wq
command Wq wq

" ----------------------------------------------------

" ---------- setup vim startup defautl ---------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set encoding=utf-8 " file encode
set laststatus=2
set tabstop=2 " change tab width
set shiftwidth=2 " affects what happens when you press >>, << or =
set softtabstop=2 " tell backspace gose back step or tab width
set expandtab " convert tab to space
set backspace=indent,eol,start " fix backspace notworking
set ruler " display status line/colmun number at buttom
set number " display line number
set hls
set mouse=a
set wildmenu
set tags=tags
set termguicolors
set noswapfile
set ttyfast
set lazyredraw
set foldnestmax=10
set nofoldenable
set foldlevel=2
set foldmethod=indent
set background=dark
set guifont=FuraMono\ Nerd\ Font\ Mono:h14
set number relativenumber
set nu rnu
set nobackup
set nowritebackup
set updatetime=200
colorscheme one 
" colorscheme sublimemonokai 
syntax on

" set backupdir=~/.vim/backup/
" set directory=~/.vim/swap/
" set undodir=~/.vim/undo/
" --------------------------------------------------

" plugin setting
" -------------- airline setting -------------------
let g:airline_theme                           = 'one'
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts                 = 1
if !exists('g:airline_symbols')
  let g:airline_symbols                       = {}
endif
let g:airline_symbols.space                   = "\ua0"
" --------------------------------------------------


" -------- ag function setting for fzf -------------
let g:ackprg = 'ag --vimgrep'
" install --> https://github.com/ggreer/the_silver_searcher
" --------------------------------------------------

" ----------- ale syntax setting -------------------
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'javascript': ['eslint'],
      \  'python': ['autopep8'],
      \  'scss': ['stylelint'],
      \  'ruby': ['rubocop'],
      \  'php': ['php_cs_fixer'],
      \  'html': ['alex'],
      \  'erb': ['erb']
      \}

let g:ale_sign_error     = emoji#for('collision')
" let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
" let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
" let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
" let g:gitgutter_sign_modified_removed = emoji#for('collision')
let g:ale_fix_on_save    = 0
" -------------------------------------------------

" ----------- indent plugin setting ---------------
" let g:indentLine_concealcursor = 'inc'
" let g:indentLine_conceallevel  = 2
" let g:indentLine_enabled       = 1
" let g:indentLine_char          = '┆'
" -------------------------------------------------

" ----------------- vim move ----------------------
let g:move_key_modifier = 'C'

" ---------------- git gutter ---------------------
let g:gitgutter_highlight_lines       = 0
" -------------------------------------------------

" ----------------- snippet ----------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" -------------------------------------------------

" ---------------- NERDTree ---------------------
let NERDTreeMinimalUI        = 1
let NERDTreeDirArrows        = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeWinSize          = 31

let ruby_no_expensive = 1

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
autocmd BufReadPre *.js let b:javascript_lib_use_ramda = 1
autocmd BufReadPre *.js let b:javascript_lib_use_d3 = 1
autocmd BufReadPre *.js let b:javascript_lib_use_vue = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_chai = 1
autocmd BufReadPre *.js let b:javascript_lib_use_jasmine = 1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd FileType rb let b:vcm_tab_complete = "omni"
autocmd FileType js let b:vcm_tab_complete = "omni"
autocmd FileType py let b:vcm_tab_complete = "omni"
autocmd FileType html let b:vcm_tab_complete = "omni"
autocmd FileType css let b:vcm_tab_complete = "omni"
autocmd FileType scss let b:vcm_tab_complete = "omni"
