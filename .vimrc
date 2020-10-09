call plug#begin()
Plug 'vim-ruby/vim-ruby'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
Plug 'mattn/emmet-vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-emoji'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'pgavlin/pulumi.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junk-e/identity.vim'
Plug 'sheerun/vim-polyglot'
Plug 'arcticicestudio/nord-vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'StanAngeloff/php.vim'
call plug#end()

" export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
" brew install ripgrep

" ------------- key map setting -------------------
nnoremap <leader>d :NERDTreeToggle<CR>

nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
cnoremap <leader><Tab> <C-C><Esc>

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
" nnoremap dd "_dd
" nnoremap ; :

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" save file
vmap <C-s> :w<CR>
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>i

" fugit
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

" vim-test
nmap <leader>ttn :TestNearest<CR>
nmap <leader>ttf :TestFile<CR>
nmap <leader>tts :TestSuite<CR>

" ale
nnoremap <leader>ff :ALEFix<CR>

" ctag
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <leader>bbt :botright term<CR>

"  coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Press Tab and Shift+Tab and navigate around completion selections
function! s:check_back_space() abort
  let col = col('.') -1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <silent><expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" :
  \ <SID>check_back_space() ? "\<S-Tab>" :
  \ coc#refresh()

" Press Enter to select completion items or expand snippets
inoremap <silent><expr> <CR>
  \ pumvisible() ? "\<C-y>" :
  \ "\<C-g>u\<CR>"

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

" ---------- custom commands -------------------------
command W w
command Q q
command WQ wq
command Wq wq

set encoding=utf-8 " file encode
set laststatus=2
set tabstop=2 " change tab width
set shiftwidth=2 " affects what happens when you press >>, << or =
set softtabstop=2 " tell backspace gose back step or tab width
set expandtab " convert tab to space
set backspace=indent,eol,start " fix backspace notworking
set ruler " display status line/colmun number at buttom
set hls
set mouse=a
set wildmenu
set tags=tags
set noswapfile
" set foldnestmax=10
" set nofoldenable
" set foldlevel=2
" set foldmethod=indent
set nofoldenable
set guifont=FuraMono\ Nerd\ Font\ Mono:h14
set number 
set spell spelllang=en_us
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
set ttyfast
set lazyredraw
set nowrap
set termguicolors
set t_Co=256
set background=dark
set regexpengine=1
set cursorline
set synmaxcol=128
syntax sync minlines=256
set re=1
colorscheme nord
syntax on

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




" -------- fzf -------------
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
" --------------------------------------------------
" -------- ag function setting for fzf -------------
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif
" install --> https://github.com/ggreer/the_silver_searcher
" --------------------------------------------------

" " ----------- ale syntax setting -------------------
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
let g:ale_linter_aliases = {'tsx': ['typescriptreact', 'typescript']}
let g:ale_disable_lsp = 1
let g:ale_sign_error  = emoji#for('collision')
" " -------------------------------------------------

" ----------- indent plugin setting ---------------
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel  = 2
let g:indentLine_enabled       = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" -------------------------------------------------

" ----------------- vim move ----------------------
let g:move_key_modifier = 'C'

" --------------- coc extensions ---------------
let g:coc_global_extensions = [
      \ 'coc-tsserver', 
      \ 'coc-emmet', 
      \ 'coc-css', 
      \ 'coc-html', 
      \ 'coc-json', 
      \ 'coc-eslint', 
      \ 'coc-git', 
      \ 'coc-json', 
      \ 'coc-markdownlint', 
      \ 'coc-python', 
      \ 'coc-snippets', 
      \ 'coc-html', 
      \ 'coc-highlight',
      \ 'coc-spell-checker',
      \ 'coc-vimlsp',
      \ 'coc-phpls',
      \]
let g:coc_snippet_next = '<S-Tab>'              " Use Tab to jump to next snippet placeholder
" -------------------------------------------------

" ---------------- NERDTree ---------------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

let NERDTreeMinimalUI        = 1
let NERDTreeDirArrows        = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeWinSize          = 31

let g:user_emmet_leader_key='<C-Z>'

let NERDTreeHighlightCursorline=0

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufWritePre *.php %s/\s\+$//e
autocmd BufWritePre *.js %s/\s\+$//e
autocmd BufWritePre *.ts %s/\s\+$//e
autocmd BufWritePre *.tsx %s/\s\+$//e
autocmd BufWritePre *.py %s/\s\+$//e
autocmd BufWritePre *.rb %s/\s\+$//e
autocmd BufWritePre *.json %s/\s\+$//e

au BufEnter,BufNew *.php :set tabstop=4
au BufEnter,BufNew *.php :set shiftwidth=4
au BufEnter,BufNew *.php :set softtabstop=4
