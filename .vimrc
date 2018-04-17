call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'mxw/vim-jsx'
Plug 'isruslan/vim-es6'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'altercation/vim-colors-solarized'
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
Plug 'nightsense/simplifysimplify'
Plug 'tpope/vim-fugitive'
Plug 'Badacadabra/vim-archery'
Plug 'fneu/breezy'
Plug 'junegunn/vim-emoji'
Plug 'tonsky/FiraCode'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-easy-align'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" ------------- key map setting ------------------- 
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>w :w<CR> 
map <leader>q :q<CR>
map <leader>a :Ag<CR>
map <leader>e "+y
nnoremap <leader>sr :source ~/.vimrc<CR>
inoremap jj <Esc>
noremap <leader>/ :Commentary<CR>
noremap <leader>find :FZF<CR>
noremap <S-w> <C-w>
nnoremap <CR> i<CR><Esc>
nnoremap <Space> i<Space><Esc>
noremap <silent><leader>r :RRB<CR>
nnoremap Q <Nop>
nnoremap L <s-$>
vnoremap L <s-$>
nnoremap H <s-^>
vnoremap H <s-^>

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
" ----------------------------------------------------

" ---------- setup vim startup defautl ---------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

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
set guifont=Fira\ Code:h12
set termguicolors
set background=light
set noswapfile
colorscheme quantum
syntax on
" set backupdir=~/.vim/backup/
" set directory=~/.vim/swap/
" set undodir=~/.vim/undo/
" --------------------------------------------------


" plugin setting
" -------------- airline setting -------------------
let g:airline_theme='quantum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1 
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" --------------------------------------------------


" -------- ag function setting for fzf -------------
let g:ackprg = 'ag --vimgrep'
" install --> https://github.com/ggreer/the_silver_searcher
" --------------------------------------------------

" ----------- ale syntax setting -------------------
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
" -------------------------------------------------

" ------------ refresh browser --------------------
let g:RefreshRunningBrowserDefault = 'chrome'
" -------------------------------------------------

" ----------- indent plugin setting ---------------
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 1
let g:indentLine_char = '┆'
" -------------------------------------------------

" ----------------- vim move ----------------------
let g:move_key_modifier = 'C'

" ---------------- git gutter ---------------------
let g:gitgutter_sign_modified_removed = emoji#for('scream')
let g:gitgutter_highlight_lines = 0
" -------------------------------------------------

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"


" ---------------- NERDTree ---------------------
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
