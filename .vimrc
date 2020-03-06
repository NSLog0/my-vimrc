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
Plug 'tpope/vim-haml'
Plug 'brigade/scss-lint'
Plug 'rakr/vim-one'
Plug 'isruslan/vim-es6'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'junegunn/vim-emoji'
Plug 'leafgarland/typescript-vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' } 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
noremap  <leader>find :Files<CR>
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
tnoremap <Esc> <C-W>N
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

nnoremap <leader>btt :botright term<CR>
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
set lazyredraw
set foldnestmax=10
set nofoldenable
set foldlevel=2
set foldmethod=indent
set background=dark
set guifont=FuraMono\ Nerd\ Font\ Mono:h14
set number relativenumber
set nu rnu
set spell spelllang=en_us
" set clipboard=unnamed
set timeoutlen=1000        " speed vim up
set ttimeoutlen=0          " https://stackoverflow.com/questions/37644682/why-is-vim-so-slow/37645334
set ttyfast                " Rendering
set tw=500
" -------- coc --------
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=200
set shortmess+=c
set signcolumn=yes
" -------- coc --------
colorscheme one
" colorscheme sublimemonokai
syntax on

" set backupdir=~/.vim/backup/
" set directory=~/.vim/swap/
" set undodir=~/.vim/undo/
" --------------------------------------------------

" plugin setting
" -------------- airline setting -------------------
let g:airline_theme                           = 'nord'
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
      \  'typescript': ['eslint'],
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
let g:ale_completion_tsserver_autoimport = 1
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

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ }
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <silent><expr> <c-space> coc#refresh()
" Apply AutoFix to problem on the current line.
nmap <leader>ff  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
autocmd BufReadPre *.js let b:javascript_lib_use_ramda = 1
autocmd BufReadPre *.js let b:javascript_lib_use_d3 = 1
autocmd BufReadPre *.js let b:javascript_lib_use_vue = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_chai = 1
autocmd BufReadPre *.js let b:javascript_lib_use_jasmine = 1

autocmd FileType rb let b:vcm_tab_complete = "omni"
autocmd FileType js let b:vcm_tab_complete = "omni"
autocmd FileType ts let b:vcm_tab_complete = "omni"
autocmd FileType py let b:vcm_tab_complete = "omni"
autocmd FileType html let b:vcm_tab_complete = "omni"
autocmd FileType css let b:vcm_tab_complete = "omni"
autocmd FileType scss let b:vcm_tab_complete = "omni"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction
