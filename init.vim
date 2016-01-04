" => General {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype off
set nocompatible
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread


set shell=/bin/zsh
set rtp+=~/.fzf

au BufRead /tmp/mutt-* set tw=72
" }}}
" => Plug {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto install plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config//nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
"Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
	let g:oblique#incsearch_highlight_all = 1
	let g:oblique#clear_highlight = 1
	let g:oblique#prefix = "\\v" " Very Magic
Plug 'terryma/vim-multiple-cursors'
	let g:multi_cursor_use_default_mapping = 0
	let g:multi_cursor_next_key='<C-j>'
	let g:multi_cursor_prev_key='<C-k>'
	let g:multi_cursor_skip_key='<C-l>'
	let g:multi_cursor_quit_key='<Esc>'

call plug#end()

" With a map leader it's possible to do extra key combinations like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"}}}
" => VIM user interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the Wild menu
set wildmenu
set wildmode=list:longest,full

" Ignore compiled files
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"Always show current position
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd

" Height of command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set ww=h,l,b,s,<,>,[,]

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets/parenthesis when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Hide the mouse cursor while typing
set mousehide

" Automatically write a file when leaving a modified buffer
set autowrite

" Find what these are for
set copyindent
set formatoptions=qrn1j
set hidden
set modelines=0
set number
set shiftround
set showmode
set splitright
set syntax=markdown
set title
set ttyfast

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Don't try to highlight lines longer than 800 characters
set synmaxcol=800

" Time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" urxvt vertical bar
if &term =~ "^urxvt"
    let &t_SI .= "\<Esc>[5 q"
    let &t_EI .= "\<Esc>[1 q"
endif
" }}}
" => Color scheme {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

set t_Co=256
colorscheme gotham
set background=dark
hi Normal ctermbg=none "keeps same background as xresources

if has("gui_running")
    colorscheme solarized
    set background=light
endif


"Remove toolbar and menu bar and make text tabs
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set guioptions-=e


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Set Unix as the standard file type
set ffs=unix,dos,mac

highlight Pmenu ctermfg=15 ctermbg=0
highlight PmenuSel ctermbg=8
" }}}
" => Backups {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile
set undofile
set undolevels=1000
set undoreload=10000
set undodir=~/.nvim/tmp/undo//       " undo files

" }}}
" => Text, tab, spaces, wrapping and indent related {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent "auto indent
set smartindent "smart indent
set wrap "wrap lines

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Change all existing tabs to current tab settings
" :retab

" }}}
" => Status line {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" }}}
" => Trailing whitespace {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Only shown when not in insert mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" Everytime the user issue a :w command, Vim will automatically remove all trailing whitespace before saving
autocmd BufWritePre * :%s/\s\+$//e

" }}}
" => Line Return {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \     execute 'normal! g`"zvzz' |
            \ endif
augroup END

" }}}
" => Convenience mappings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cylces through splits using a double press of enter in normal mode
nmap <CR><CR> <C-w><C-w>

" Toggle line numbers
"nnoremap <leader>n :setlocal number!<cr>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" Ranger
nnoremap <leader>r :silent !ranger %:h<cr>:redraw!<cr>
nnoremap <leader>R :silent !ranger<cr>:redraw!<cr>

" Auto clear highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

" Navigating Long lines that Wrap
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

"Make ; behave as :
nnoremap ; :

"Changes Esc mapping
inoremap <C-@> <esc>

nnoremap<leader>q :q!<cr>

" }}}
" => Searching and movement {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_
""}}}
" => Folding {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=marker
set foldmarker={{{,}}}
set foldlevelstart=0
set foldnestmax=3

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" }}}
" => Scrolling {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start scrolling when we're 8 lines away from margins
set scrolloff=8

" Minimum lines to keep above and below cursor
set sidescrolloff=15

" Lines to scroll when cursor leaves screen
set scrolljump=5
set sidescroll=1

" }}}
"=> Plugins{{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

"}}}
"=> UltiSnippets {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsListSnippets="<C-e>"

"make YCM compatible with UltiSnips (using Supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"}}}
"=> delimitMate {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-j> <C-g>g
let delimitMate_jump_expansion = 1
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 2
"}}}
"=> Syntastic {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_enable_balloons = 1
let g:syntastic_c_checkers = ['clang_check']
"}}}
"=> YCM {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/dotfiles/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_complete_in_comments = 1
"}}}
" => Airline {{{
""""""""""""""""
" Makes airline display at all times
set laststatus=2


" Makes vim use airline tabs
"let g:airline#extensions#tabline#enabled = 1

" Change the seperator to blank
let g:airline_left_sep=''
let g:airline_right_sep=''

let g:airline_powerline_fonts=1
let g:airline_theme =  'bubblegum'
"}}}
"}}}
" => Misc {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly open a buffer for scribble
"map <leader>q :e ~/buffer<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Pressing ,s will save file
map <leader>s :update<cr>

"Changed Cursor during insert mode
if &term =~ '^rxvt'
  let &t_SI .= "\<Esc>[5 q"
  let &t_EI .= "\<Esc>[1 q"
  " 1 or 0 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

let g:python3_host_prog = '/usr/bin/python'

" }}}
