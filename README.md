# my-vimrc
My vimrc that use everyday
```
call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'mxw/vim-jsx'
Plug 'isruslan/vim-es6'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'mkitt/browser-refresh.vim'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'
Plug 'matze/vim-move'
Plug 'jscappini/material.vim'
Plug 'wolverian/minimal'
Plug 'nightsense/simplifysimplify'
Plug 'SirVer/ultisnips'
Plug 'epilande/vim-react-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'tpope/vim-fugitive'
Plug 'Badacadabra/vim-archery'
call plug#end()

" ------------------- key map setting -------------------------
map <C-n> :NERDTreeToggle<CR>
map <leader>f :FZF<CR>
noremap <leader>/ :Commentary<CR>
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>a :Ag<CR>
map <leader>g :GFiles?<CR> 
map <leader>e "*y
inoremap jj <Esc>
noremap <S-w> <C-w>
nnoremap <CR> i<CR><Esc>
nnoremap <Space> i<Space><Esc>
nnoremap 9 <s-$>
vnoremap 9 <s-$>
noremap <silent><leader>r :RRB<CR>

" fugit
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
" -------------------------------------------------------------

" ---------------- setup vim startup defautl -----------------

" set term=builtin_ansi       
" set termguicolors
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
syntax on
set termguicolors
" colorscheme material
" colorscheme minimal
" set background=light
" colorscheme simplifysimplify-light
" colorscheme rupza
colorscheme archery
" ------------------------------------------------------------


" plugin setting
" -------------------------------- airline setting ---------------------------------------
let g:airline_theme='archery'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1 
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" ---------------------------------------------------------------------------------------


" -------------- ag function setting for fzf ---------------
" let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --vimgrep'
" ---------------------------------------------------------

" ---------------------- ale syntax setting ---------------------------------
" let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_fixers = {
\  'javascript': ['prettier', 'eslint'],
\  'ruby': ['rubocop'],
\  'python': ['autopep8', 'pylint']
\}

let g:ale_sign_error = '@e'
let g:ale_sign_warning = '@w'
let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_use_local_config = 1
let g:ale_set_highlights = 0

let g:RefreshRunningBrowserDefault = 'chrome'
" -------------------------------------------------------------------------

" ----------------- indent plugin setting ----------------------
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 1
" -------------------------------------------------------------
let g:move_key_modifier = 'C'

```
