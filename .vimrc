set nocompatible "be iMproved, required
filetype off "required

"" ========================================================================
" Plugin Management

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage itself, required
Plugin 'gmarik/Vundle.vim'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'mhinz/vim-startify'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'suan/vim-instant-markdown'
Plugin 'unblevable/quick-scope'
Plugin 'ryanoasis/vim-webdevicons'
Plugin 'chikamichi/mediawiki.vim'
Plugin 'gilgigilgil/anderson.vim'
Plugin 'mattn/emmet-vim'
Plugin 'zenorocha/dracula-theme',{'rtp':'vim/'}
Plugin 'morhetz/gruvbox'
Plugin 'plasticboy/vim-markdown'
Plugin 'justinmk/vim-dirvish'
" All of your Plugins must be added before the following line
" plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'Arduino-syntax-file'
Plugin 'Hardy'
Plugin 'txt.vim'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ========================================================================
" Mappings
let mapleader=','
" <silent> means that wont be echoed in command line
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" See if can open codesnippets
nmap <silent> <leader>ecs :e ~/workspace/code_snippets.txt<CR>
" Toggle spell checking
nmap <silent> <leader>s :set spell!<CR>
" Dont use Ex mode, use Q for formatting
map Q gq
" Make p in Visual mode replace the selected text with the "" register
" Remember to look for :help gv - Reselect Visual mode
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" ========================================================================
" Options
set nu
set laststatus=2
set tabstop=4
set shiftwidth=4
set expandtab
set smartcase
set smartindent
set incsearch
set wildmenu
" ========================================================================
" Dictionaries and Thesaurus
 set thesaurus+=/home/hmendoza/.diktionarios/mthesaur.txt
 set dictionary+=/usr/share/dict/words

" ========================================================================
augroup filetype
  au! BufRead,BufNewFile *.prototxt setfiletype proto
  au! BufRead,BufNewFile *.proto setfiletype proto
  autocmd! BufRead,BufNewFile *.ino setlocal ft=arduino
augroup end

" ========================================================================
autocmd BufRead *.tex set textwidth=80
" ========================================================================
" Airplane and Airline Plugin Options
set t_Co=256
"colorscheme PaperColor

set t_ZH=[3m
set t_ZR=[23m
let g:gruvbox_italic=1
colorscheme gruvbox
"set background=light
set background=dark
let g:gruvbox_contrast_dark='soft'
"g:gruvbox_contrast_light='hard'

"let g:airline_theme='papercolor'
let g:airline_theme='gruvbox'

let g:airline_left_sep = '»'
let g:airline#extensions#tagbar#enabled = '1'
let g:airline#extensions#tagbar#flags = 's'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t:.'

" ========================================================================
" Startify Plugin Options
let g:startify_bookmarks = [
	\ '~/.vimrc',
	\ '~/workspace/code_snippets.txt',
	\ ]
let g:startify_session_dir = '~/.vim/sessions/'
let g:startify_custom_footer = [
	\ '', "   Ad Majorem Dei Gloriam. Viva Jesús en nuestros corazones. ", '']

let g:startify_custom_header =
	\ map(split(system('fortune -ac | cowsay -f turtle'), '\n'), '"   ". v:val') + ['']

" ========================================================================
" Arduino-Hardy Options
let g:hardy_split_direction = 1
let g:hardy_window_name = '__HDMP_ARDUINO_INFO__'
let g:hardy_window_size = 15

" ========================================================================
" CtrlP Plugin Options
nmap <silent> <leader>p :CtrlP<CR>
let g:ctrlp_arg_map = 1

" ========================================================================
" Quick Scope Plugin Options
"
" Map the leader key + q to toggle quick-scope's highlighting in normal/visual
" mode.
" nmap <leader>q <plug>(QuickScopeToggle)
" vmap <leader>q <plug>(QuickScopeToggle)

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" ========================================================================
" Extra Options
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

if has('gui_running')
    set guioptions-=T " no Toolbar
    set guifont=Envy\ Code\ R\ 11 " Envy Code R font
    "set guifont=Envy\ Code\ R\ Plus\ Nerd\ File\ Types\ Mono\ 11
endif
" ========================================================================
" Tagbar mediawiki support
autocmd FileType mediawiki :silent !ctags %
let g:tagbar_type_mediawiki = {
  \ 'ctagstype' : 'mediawiki',
  \ 'kinds'     : [
  \ 'h:header',
  \ ],
  \ 'sort'    : 0
  \ }
" ========================================================================
function Maximize_Window()
	silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
