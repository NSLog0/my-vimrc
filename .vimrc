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
Plug 'fneu/breezy'
Plug 'junegunn/vim-emoji'
Plug 'tonsky/FiraCode'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-easy-align'
call plug#end()

" ------------------- key map setting -------------------------
map <C-n> :NERDTreeToggle<CR>
noremap <leader>fb :FZF<CR>
noremap <leader>/ :Commentary<CR>
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>a :Ag<CR>
map <leader>e "*y
map <leader>sr :source ~/.vimrc<CR>
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

" vim-test 
nmap <leader>ttn :TestNearest<CR>
nmap <leader>ttf :TestFile<CR>
nmap <leader>tts :TestSuite<CR>

" ale
nnoremap <leader>fix :ALEFix<CR>


" ctag 
:nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
" -------------------------------------------------------------

" ---------------- setup vim startup defautl -----------------
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
syntax on
set guifont=Fira\ Code:h12
set termguicolors
set background=light
colorscheme breezy
" colorscheme simplifysimplify-light
" colorscheme rupza
" colorscheme archery
" ------------------------------------------------------------


" plugin setting
" -------------------------------- airline setting ---------------------------------------
" let g:airline_theme='archery'
let g:airline_theme='breezy'
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
\  'python': ['autopep8', 'pylint'],
\  'scss': ['prettier'],
\  'sass': ['prettier'],
\  'ruby': ['rubocop'],
\}

let g:ale_sign_error = emoji#for('poop')
let g:ale_sign_warning = emoji#for('bulb')
let g:ale_fix_on_save = 0
let g:ale_set_highlights = 0
let g:RefreshRunningBrowserDefault = 'chrome'
" -------------------------------------------------------------------------

" ----------------- indent plugin setting ----------------------
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 1
let g:indentLine_char = '.'
" -------------------------------------------------------------
let g:move_key_modifier = 'C'

" --------------------------git gutter -----------------------
let g:gitgutter_sign_modified_removed = emoji#for('scream')
let g:gitgutter_highlight_lines = 1
" -------------------------------------------------------------
