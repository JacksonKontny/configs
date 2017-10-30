set nocompatible               " be iMproved
filetype off                   " required!
" My Bundles here:
call plug#begin('~/.vim/bundle')
Plug 'fholgado/minibufexpl.vim'
Plug 'L9'
Plug 'fugitive.vim'
Plug 'Tabular'
Plug 'mhinz/vim-startify'
Plug 'Haml'
Plug 'Sass'
Plug 'ervandew/supertab'
Plug 'taglist.vim'
Plug 'Tagbar'
Plug 'surround.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
" Plug 'klen/python-mode'
" Plug 'Valloric/YouCompleteMe'
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jpalardy/vim-slime'
Plug 'scrooloose/nerdcommenter'
Plug 'janko-m/vim-test'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
" Plug 'maralla/completor.vim'
" Plug 'scrooloose/syntastic'
" Plug 'vim-scripts/The-NERD-tree'
" Plug 'kchmck/vim-coffee-script'
" Plug 'ZenCoding.vim'
" Plug 'chrisburnor/project_fuzzyfinder'
" Plug 'ftpluginruby.vim'
" Plug 'endwise.vim'
" Plug 'matchit.zip'
" Plug 'kien/ctrlp.vim'
" Plug 'plasticboy/vim-markdown'
" Plug 'nvie/vim-flake8'
" Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
call plug#end()

" Powerline Setup
set laststatus=2
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set nofoldenable
let python_highlight_all=1
syntax on
let g:neomake_python_enabled_makers = ['pylint']

filetype plugin indent on     " required! 
inoremap # X<BS>#
"######################## Fuzzy Find ##########################################
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-x': 'split',
\ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~40%' }

" " In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

noremap <C-a> :Files<CR>
"##############################################################################
" Misc
set number
set list
set ruler
set backspace=2
" Set max number of tabs
set tabpagemax=50
" File tabs allways visible
set showtabline=2

" expand tabs to spaces
set expandtab

set copyindent
set smartindent
set number
set shiftround
set showmatch
set ignorecase
set smartcase

set smarttab
set hlsearch
set incsearch

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu
set wildmode=longest,list
set hidden
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set backspace=indent,eol,start

" New tab bindings
noremap :te :tabe 
noremap <silent> tl :tabnext<cr>
noremap <silent> th :tabprevious<cr>

" move tabs left and right according to standard vim keybindings
nmap <silent> :tmh<cr> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nmap <silent> :tml<cr> :execute 'silent! tabmove ' . tabpagenr()<CR>

if &t_Co >= 256 || has("gui_running")
  set background=dark
  colorscheme solarized
endif

" switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Omnicompletion
filetype plugin on
set ofu=syntaxcomplete#Complete

" Save vim session
map <leader>s :S\Save
map <leader>o :SLoad

" Ctags Shortcuts
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Taglist Configuration
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50

" Tagbar configuration
map <leader>e :TagbarToggle<CR>

" Make sure that the cursor does not change position when switching from
" insert to command mode
inoremap <silent> <Esc> <Esc>`^


" Project Fuzzyfinder shortcut
"map f :call ProjectFuzzyFind()<CR>

" Make it easy to open vimrc
let mapleader = ","
"##############################################################################                                                    
" Easier split                       
"##############################################################################                                                    
" Better window changing keys
nmap 1 <C-w>
nmap 2h :bp<CR>
nmap 2l :bn<CR>
nmap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
" Use semicolon instead of colon to enter commands
" Must be last so that previous commands don't break
map ; :
"
" Fix slow autocomplete with YouCompleteMe and py-mode
let g:pymode_breakpoint = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0
if !has('nvim')
    " Stuff that neovim already does
    set ttymouse=xterm2
    set term=xterm-256color
    set encoding=utf-8
    " MacVim Recommendations
    set clipboard=unnamed
    set wildmenu
    set esckeys
    set ttyfast
    set binary
    set noeol
    set backupdir=~/.vim/backups
    set directory=~/.vim/swaps
    if exists("&undodir")
      set undodir=~/.vim/undo
    endif
endif

if has('nvim')
    set clipboard+=unnamedplus
"     set termguicolors
endif

"vim-tmux
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

"PEP-8 helper
:set colorcolumn=80

" Python Stuff

"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF
" Toggling rather than two different keys + autosave
" Setting ipdb breakponts
python << EOF
import vim
import re

ipdb_breakpoint = 'import ipdb; ipdb.set_trace()'

def set_breakpoint():
    breakpoint_line = int(vim.eval('line(".")')) - 1

    current_line = vim.current.line
    white_spaces = re.search('^(\s*)', current_line).group(1)

    vim.current.buffer.append(white_spaces + ipdb_breakpoint, breakpoint_line)

def remove_breakpoints():
    op = 'g/^.*%s.*/d' % ipdb_breakpoint
    vim.command(op)

def toggle_breakpoint():
    breakpoint_line = int(vim.eval('line(".")')) - 1
    if 'import ipdb; ipdb.set_trace()' in vim.current.buffer[breakpoint_line]:
        remove_breakpoints()
    elif 'import ipdb; ipdb.set_trace()' in vim.current.buffer[breakpoint_line-1]:
        remove_breakpoints()
    else :
        set_breakpoint()
    vim.command(':w')

vim.command('nnoremap <leader>9 :py toggle_breakpoint()<cr>')
vim.command('nnoremap <leader>0 :py remove_breakpoints()<cr>')
EOF

" ################################  VIM TEST #################################

nmap <silent> <leader>t :TestNearest<CR>
let test#strategy = "neovim"
let test#python#runner = 'djangotest'

function! AnalyteTransform(cmd) abort
python << endpython
import vim
import pyperclip
command_string = vim.eval("a:cmd")
command_list = command_string.split(' ')
vim.command('return "{}"'.format(command_list))
test_string = command_list[-1]
test_string = test_string.replace('.', '/', test_string.count('.') - 2)
test_string = test_string.replace('.', '.py:', 1)
test_string = 'fab docker_test:{},nocapture'.format(test_string)
pyperclip.copy(test_string)
vim.command('return "{}"'.format(test_string))
endpython
endfunction

let g:test#custom_transformations = {'analyte': function('AnalyteTransform')}
let g:test#transformation = 'analyte'

" ################################ END VIM TEST #################################

" Python-mode and linters

let g:pymode_lint = 0

" Git Fugitive
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gb :Gblame<CR>

" Mini Buff Explorer
nnoremap <S-T> :MBEToggle<cr>
let g:miniBufExplMaxSize = 60
let g:miniBufExplVSplit = 20
let g:miniBufExplorerAutoStart = 0

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
  au BufWritePost * Neomake
endif

" Jedi
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
"let g:jedi#autocompletions = 1


" FZF
set rtp+=/usr/local/opt/fzf
