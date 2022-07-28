" $HOME/.nvim/init.vim

let mapleader=","
set notermguicolors

if has("nvim")
  " Escape inside a FZF terminal window should exit the terminal window
  " rather than going into the terminal's normal mode.
  autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
endif



" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Use release branch (recommend)
Plug 'tpope/vim-sleuth'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'preservim/nerdtree'
Plug 'jremmen/vim-ripgrep'
Plug 'APZelos/blamer.nvim'
Plug 'wakatime/vim-wakatime'

" colorschemes
" Plug 'rakr/vim-one'
" Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

set relativenumber
filetype on
syntax on
set foldmethod=syntax
set nofoldenable
set clipboard=unnamed
set smartcase
set ignorecase
set hidden
set colorcolumn=101
nnoremap <Space> :
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" color scheme
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:one_allow_italics = 1 " I love italic for comments

" blamer.nvim for git-blame (ala gitlens)
let g:blamer_enabled = 1
let g:blamer_delay = 500


function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()

" use rg to search within files
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Close vim when nerdtree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


nnoremap <silent> <leader><space><space> :Files<CR>
nnoremap <silent> <C-p> :ProjectFiles<CR>
nnoremap <silent> <C-w> :bd<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <space>/ :RG<CR>
nnoremap <silent> <space>ft :NERDTreeFind<CR>
nmap <F8> :TagbarToggle<CR>





function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['Comment',      'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code > 0
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
  autocmd!
  " autocmd ColorScheme * call <sid>update_fzf_colors()
  autocmd VimEnter,ColorScheme * call s:update_fzf_colors()
augroup END

function! Chomp(string)
    return substitute(a:string, '\n\+$', '', '')
endfunction

function! SetBackgroundMode(...)
  let g:isDarkMode = Chomp(system("osascript -l JavaScript -e \"Application('System Events').appearancePreferences.darkMode()\""))
  if g:isDarkMode == "true"
    set background=dark
    colorscheme dracula
  elseif g:isDarkMode == "false"
    set background=light
    colorscheme one
  endif
endfunction
" call SetBackgroundMode()
" call timer_start(3000, "SetBackgroundMode")
" colorscheme dracula
" set background=dark
"
augroup filetypedetect
  au BufNewFile,BufRead access.log* setf httpclog
augroup END

