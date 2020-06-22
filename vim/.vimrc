set encoding=utf-8

" Vundle
" -------
set nocompatible                                      " be iMproved, required
filetype off                                          " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'                           " CtrlP Fuzzy File Finder
Plugin 'vim-ruby/vim-ruby'                            " Vim Ruby
Plugin 'tpope/vim-rails'                              " Rails specific stuff
Plugin 'tpope/vim-bundler'                            " Support for Ruby's bundler
Plugin 'tpope/vim-haml'                               " Haml syntax highlighting
Plugin 'tpope/vim-commentary'                         " Vim commenting using gc
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'                           " Vim surround using cs
Plugin 'slim-template/vim-slim'                       " Slim syntax highlighting
Plugin 'kchmck/vim-coffee-script'                     " CoffeeScript
Plugin 'scrooloose/nerdtree'                          " Nerd Tree view
Plugin 'danro/rename.vim'                             " Rename the current file in the vim buffer
Plugin 'christoomey/vim-tmux-navigator'               " Navigation between tmux panes and vim splits
Plugin 'ntpeters/vim-better-whitespace'               " Whitespace highlighting
Plugin 'Yggdroot/indentLine'                          " Show invisibles
Plugin 'tomasiser/vim-code-dark'
Plugin 'bluz71/vim-moonfly-colors'
Plugin 'pangloss/vim-javascript'                      " Javascript syntax highlighting
Plugin 'mxw/vim-jsx'                                  " JSX syntax highlighting
Plugin 'elixir-editors/vim-elixir'                    " Elixir syntax highlighting
Plugin 'jlanzarotta/bufexplorer'
Plugin 'szw/vim-tags'                                 " Vim with Ctags
Plugin 'tpope/vim-fugitive'                           " Git wrapper for Vim
Plugin 'tpope/vim-rhubarb'                            " GitHub extension for fugitive.vim
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'

" All of your Plugins must be added before the following line
call vundle#end()                                     " required

filetype plugin indent on                             " required
syntax on                                             " Enable syntax highlighting
filetype on                                           " Enable filetype detection
filetype plugin on                                    " Enable filetype-specific plugins

" Plugin configuration
" --------------------
" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Show hidden files in NerdTree
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Strip whitespace on file save
autocmd BufEnter * EnableStripWhitespaceOnSave

" Enable show invisibles
set conceallevel=1
let g:indentLine_conceallevel=1
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_bgcolor_gui = '#FF5F00'

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" Key mappings
" -------------
" Easy access to start of line in Normal mode
nmap 0 ^

" Easy escape from Insert mode
imap jk <esc>
imap kj <esc>

" Easier navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <Leader>i mmgg=G`m<CR>
" General configurations
" -----------------------
set rtp+=/usr/local/opt/fzf                             " Use FZF for fuzzy finding
set expandtab                                           " Convert <tab> to spaces
set tabstop=2                                           " Set tab space to 2
set splitbelow                                          " More natural split
set splitright                                          " More natural split

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Theme
" ------
colorscheme codedark
" set background = "dark"
" let g:airline_theme = farout
" set termguicolors

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

if executable('flow')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'flow',
    \ 'cmd': {server_info->['flow', 'lsp']},
    \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
    \ 'whitelist': ['javascript', 'javascript.jsx'],
    \ })
endif

" Statusline
set laststatus=2
set statusline=%{FugitiveStatusline()}:%f

" Folding style
set foldmethod=syntax
autocmd Syntax ruby,vim,xml,html,xhtml,perl normal zR

