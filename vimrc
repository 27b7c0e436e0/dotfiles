" The purpose of this file is to unify Vim settings across multiple
" environments. It follows Doug Black's division, plus some other stuff.
"
" GENERAL SETTINGS:
" ================

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Backup files
set backupdir=~/.vim_backup
set directory=~/.vim_backup

" PLUGIN INSTALLATION:
" ======

" We use 'vim-plug' as the addon manager.
" It's installed in: .vim/autoload/plug.vim
" See: https://github.com/junegunn/vim-plug
" After adding a new addon, restart Vim and run :PlugInstall

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'morhetz/gruvbox'
Plug 'mgedmin/pythonhelper.vim'
call plug#end()

" COLORS:
" ======

set termguicolors
set background=dark
syntax enable
colorscheme gruvbox
"let g:gruvbox_contrast_dark='hard'

" SPACES AND TABS:
" ===============

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set mouse-=a
set hlsearch

" UI:
" ======

set ruler
set number
set relativenumber
set showcmd
set cursorline
set wildmenu
" Always show statusline
set laststatus=2
"set lazyredraw
set showmatch
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Show trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" Uncomment if Vim starts to be too slow
"autocmd BufWinLeave * call clearmatches()

" Split below and right, instead of Vim's defaults above and left
set splitbelow
set splitright

" Make ESC behave faster.
" We could put 0, but let's keep it safe.
set ttimeoutlen=50

" Some colors:
" Highlight current line
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=black guibg=chocolate guifg=black
" Colors for statusline
hi StatusLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkslategrey guifg=white
" Change color when entering insert mode
au InsertEnter * hi StatusLine term=reverse guibg=firebrick guifg=white
au InsertLeave * hi StatusLine term=reverse guibg=darkslategrey guifg=white

" SEARCHING:
" ======

set incsearch
set hlsearch
set noignorecase
set nowrapscan

" FOLDING:
" ======

set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
" Use :help foldmethod for more methods.
" Another good one is 'syntax'.
set foldmethod=indent

" CUSTOM MOVEMENTS:
" ======

" CUSTOM LEADER:
" ======

" CtrlP SETTINGS:
" ======

" LAUNCH CONFIG:
" ======

" Tmux CONFIG:
" ======

" AUTOGROUPS:
" ======

" BACKUPS:
" ======

" CUSTOM FUNCTIONS:
" ======

" ORGANIZATION:
" ======

" PLUGIN CONFIGURATION:
" ======

" Syntastic
" ---------
" Remembember: needs 'flake8' to work
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
" Disable style checks. They're annoying
let g:syntastic_quiet_messages = { "type": "style" }

" PythonHelper
set statusline=%<%f\ %h%m%r\ %1*%{TagInStatusLine()}%*%=%-14.(%l,%c%V%)\ %P

" WRAPPING IT UP:
" ======
"

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible
"
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

