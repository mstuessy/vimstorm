set nocompatible              " be iMproved, required
filetype off                  " required

" plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" syntax
Plugin 'posva/vim-vue'
Plugin 'nelsyeung/twig.vim'
Plugin 'jwalton512/vim-blade'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'plasticboy/vim-markdown'
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'

" theme
Plugin 'joshdick/onedark.vim'

" git
Plugin 'mhinz/vim-signify'
Plugin 'zivyangll/git-blame.vim'

" spacing
Plugin 'editorconfig/editorconfig-vim'

" tabs
Plugin 'webdevel/tabulous'

" buffers
Plugin 'ap/vim-buftabline'

" tree
Plugin 'scrooloose/nerdtree'
Plugin 'PhilRunninger/nerdtree-buffer-ops'

" fuzzy search
Plugin 'junegunn/fzf.vim'

" linting
Plugin 'dense-analysis/ale'

" nvim plugin support
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

" autocomplete + language server
Plugin 'neoclide/coc.nvim'

" debugging
Plugin 'puremourning/vimspector'

" openapi
Plugin 'xavierchow/vim-swagger-preview'

" git integrations
Plugin 'ruanyl/vim-gh-line'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'

" multi selection/cursor
Plugin 'mg979/vim-visual-multi'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype indent plugin on

" squiggly line hack
highlight EndOfBuffer ctermfg=black ctermbg=black

" deal with vertical stuff
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

set hidden
nnoremap <c-m> :bnext<cr>
nnoremap <c-b> :bprev<cr>

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'

" buftabline
let g:buftabline_show = 2
let g:buftabline_indicators = 'on'
let g:buftabline_numbers = 1

" php linting
" let g:ale_use_global_executables = 1

let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'

let g:ale_set_highlights = 0

let g:ale_php_phpcs_options='--standard=PSR12'
let g:ale_php_phpstan_options = '--standard=PSR12'

let g:ale_linters = {
    \'php': ['php', 'phpcs', 'langserver', 'phpstan', 'phpmd'],
    \'typescript': ['eslint', 'tsserver', 'typecheck', 'standard', 'xo'],
    \'javascript': ['eslint', 'tsserver']
\}

let g:ale_linters_explicit = 1

" ale (linting)
let g:ale_php_langserver_executable = expand('~/.composer/vendor/bin/php-language-server.php')
let g:ale_php_phpstan_executable = expand('~/.composer/vendor/bin/phpstan')
let g:ale_php_phpcs_executable = expand('~/.composer/vendor/bin/phpcs')
let g:ale_php_phpmd_executable = expand('~/.composer/vendor/bin/phpmd')
let g:ale_javascript_eslint_executable = expand('./node_modules/.bin/eslint')
let g:ale_javascript_eslint_use_global = 0

" git blame stuff
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" bind nerdtree toggle
nmap <F1> :NERDTreeToggle<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

set foldlevel=20
set nospell             " disable vim spelling
set rnu                 " relative line numbers
syntax enable           " enable syntax processing
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

set number              " show line numbers
set showcmd             " show command in bottom bar
" set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" Search settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" fzf settings
set rtp+=/usr/local/opt/fzf
nnoremap <c-p> :FZF<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" enable mouse
set mouse=a

" set colorscheme
set termguicolors
colorscheme onedark

" prevent lines from wrapping
set nowrap

" connect with system clipboard
set clipboard+=unnamed

" Example of implementation with vim's inputlist() function
function! InputListCustomStrategy(label, choices, ResultHandler)
    echo a:label
    let choice = inputlist(s:add_number_to_choices(a:choices))

    if (choice == 0)
        throw "cancelled"
    endif

    call a:ResultHandler(a:choices[choice - 1])
endfunction

" point to typescript executable
let $PATH=$PATH . ':/usr/local/Cellar/node/13.3.0/bin'

" coc stuff

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" vimspector
nmap <leader>vr :VimspectorReset<CR>
nmap <leader>ve :VimspectorEval
nmap <leader>vw :VimspectorWatch
nmap <leader>vo :VimspectorShowOutput
nmap <leader>vi <Plug>VimspectorBalloonEval
xmap <leader>vi <Plug>VimspectorBalloonEval

" git
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

set diffopt=vertical
