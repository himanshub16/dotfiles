" https://github.com/himanshub16/MyScripts/
" Sources used
" https://github.com/mhartington/dotfiles/blob/master/.vimrc
" Documentations
" Setup Vim Plug
" If Vim Plug is not installed, install it
if has('nvim')
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
		call system("pip install --user neovim")
		call system("pip3 install --user neovim")
	endif
else
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif

" List of plugins I use
call plug#begin("~/.local/share/nvim/plugged")

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
"Plug 'chriskempson/base16-vim'
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
Plug 'Shougo/neoinclude.vim'
Plug 'majutsushi/tagbar'

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
elseif has('lua')
	Plug 'Shougo/neocomplete'
endif

if has('python3')
	Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer' }
else
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
endif
" Because youcompleteme takes time to download and install
"Plug '~/.you-complete-me-python-3'

call plug#end()

" general settings
let mapleader = ','
set number
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set clipboard=unnamed
set encoding=utf-8
" no need for ex mode
nnoremap Q <nop>
" I don't need recording macros
map q <nop>
" trying to avoid shift
noremap ; :
" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

" Switch buffers with leader+tab like ctrl+tab
noremap <leader><tab> :bn<CR>
" Don't want to press Ctrl to move screen
noremap <leader>f <C-f><CR>
noremap <leader>b <C-b><CR>
noremap <leader>d <C-d><CR>
noremap <leader>u <C-u><CR>

" nerdtree
nmap <leader>ne :NERDTree<cr>

" tagbar
nmap <leader>tb :TagbarToggle<cr>

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.spac = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{strftime("%H:%M")}'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2
autocmd VimEnter * SyntasticToggleMode

" nerdcommenter
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_confirm_extra_conf = 0
let g:ycm_path_to_python_interpreter = "python3"
let g:ycm_server_python_interpreter = "python"

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

" Use Deoplete.
let g:deoplete#enable_at_startup = 1
let g:elixir_docpreview = 0

" Let <Tab> also do completion
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-i>"

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif"


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
set conceallevel=2 concealcursor=niv
endif
"
"
let vim_markdown_preview_toggle=2
