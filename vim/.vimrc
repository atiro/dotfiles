
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2014 Feb 05
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=r
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " For Ruby/Rails/Python files always show line numbers
  autocmd FileType ruby,python setlocal number
  " For Ruby always open with the tabr sidebar panel
  autocmd FileType ruby TagbarOpen

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif



" Specific support for use in Mutt
" Taken from - http://www.256bit.org/~chrisbra/cms/vim_as_e-mail_editor.html

let attach_check_keywords="attached,attaching"

filetype plugin on

" Highlight stray tabs

match errorMsg /[^\t]\zs\t\+/

" Set Status bar to something useful
" See :help 'statusline' for format options

set laststatus=2
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%041,%04v]\ [%p%%]\ [LEN=%L]

" Highlight cursor line and column

" set cursorline
" set cursorcolumn

" Check my speling

set spell
set spellsuggest=5

" Abbreviations (should be in own file)

source $HOME/.vim/abbreviations.vim

" Mappings

source $HOME/.vim/mappings.vim

" Read in Templates
"
function! LoadTemplate(extension)
  silent! :execute '0r $VIMHOME/templates/'. a:extension. '.tpl'
  silent! execute 'soruce $VIMHOME/templates/'.a:extension.'.patterns.tpl'
endfunction

autocmd BufNewFile * silent! call LoadTemplate('%:e')

" Tabbar options
"
nmap <F8> :TagbarToggle<CR>

" Syntastic options
" Status line seems to break?

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Setup dictionary for autocomplete

set dictionary+=/usr/share/dict/words

set complete+=k

" Sessions

set viewdir=$HOME/.vim/views

" Set indent

set smartindent

" Set colour scheme

colorscheme slate
set background=dark


set selectmode=mouse,key
set mousemodel=extend

set ignorecase
set smartcase

set showmatch

" Tabbing

set tabstop=4
set shiftwidth=4
set softtabstop=4

" Faster Reg Ex Engine ?

set regexpengine=2

set packpath^=~/.vim
packadd minpac
call minpac#init()

call minpac#add('tpope/vim-surround', {'type': 'opt'})
call minpac#add('tpope/vim-rails')
call minpac#add('k-takata/minpac', {'type': 'opt'})

runtime macros/matchit.vim
