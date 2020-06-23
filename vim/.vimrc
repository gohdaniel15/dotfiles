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

" Plugin 'ctrlpvim/ctrlp.vim'                           " CtrlP Fuzzy File Finder
Plugin 'junegunn/fzf'                                 " A command-line fuzzy finder
Plugin 'junegunn/fzf.vim'                             " FZF plugin for vim
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
Plugin 'leafgarland/typescript-vim'                   " Typescript syntax files for Vim
Plugin 'neoclide/coc.nvim'                            " Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode

" All of your Plugins must be added before the following line
call vundle#end()                                     " required

filetype plugin indent on                             " required
syntax on                                             " Enable syntax highlighting
filetype on                                           " Enable filetype detection
filetype plugin on                                    " Enable filetype-specific plugins

" Plugin configuration
" --------------------
" Make CtrlP use ag for listing the files. Way faster and no useless files.
" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
" let g:ctrlp_use_caching = 0

" FZF Configuration
" -----------------
nnoremap <c-p> :Files<CR>

" Show hidden files in NerdTree
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
" Show NerdTree when editor is opened at the start
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Strip whitespace on file save
let g:strip_whitespace_on_save = 1

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

" Enable mouse
" ------------
set mouse=a

" Easy escape from Insert mode
" imap jk <esc>
" imap kj <esc>

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

" In charge of line number magic
" ------------------------------
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

" Statusline
set laststatus=2
set statusline=%{FugitiveStatusline()}:%f

" Folding style
set foldmethod=syntax
autocmd Syntax ruby,vim,xml,html,xhtml,perl normal zR

" Prettier
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

" COC configuration
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
