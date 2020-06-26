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
" Plugin 'quramy/tsuquyomi'                                                                                            

" nvim plugin support                                                                                                  
Plugin 'roxma/nvim-yarp'                                                                                               
Plugin 'roxma/vim-hug-neovim-rpc'                                                                                      

" autocomplete + language server                                                                                       
Plugin 'neoclide/coc.nvim'                                                                                             

" debugging                                                                                                            
Plugin 'vim-vdebug/vdebug'                                                                                             
Plugin 'puremourning/vimspector'                                                                                       

" openapi                                                                                                              
Plugin 'xavierchow/vim-swagger-preview'                                                                                

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

" \'typescript': ['tslint', 'standard', 'tsserver', 'typecheck', 'xo'],

let g:ale_linters_explicit = 1                                                                                         

" ale (linting)                                                                                                        
let g:ale_php_langserver_executable = expand('~/.composer/vendor/bin/php-language-server.php')
let g:ale_php_phpstan_executable = expand('~/.composer/vendor/bin/phpstan')
let g:ale_php_phpcs_executable = expand('~/.composer/vendor/bin/phpcs')
let g:ale_php_phpmd_executable = expand('~/.composer/vendor/bin/phpmd')
let g:ale_javascript_eslint_executable = expand('./node_modules/.bin/eslint')

" let g:ale_typescript_tsserver_config_path = expand('./.eslintrc.json')
" let g:ale_typescript_tsserver_config_path = expand('./.eslintrc.json')
let g:ale_javascript_eslint_use_global = 0                                                                             

" ###############                                                                                                      
" custom bindings                                                                                                      
" ###############                                                                                                      

" git blame stuff                                                                                                      
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>                                                                      

" bind nerdtree toggle                                                                                                 
nmap <F1> :NERDTreeToggle<CR>                                                                                          

" turn off search highlight                                                                                            
nnoremap <leader><space> :nohlsearch<CR>                                                                               

" phpactor UseAdd                                                                                                      
map ,ua :call phpactor#UseAdd()                                                                                        

" phpactor ExtractMethod                                                                                               
map ,em :call phpactor#ExtractMethod()                                                                                 

" nnoremap <y><u> :call phpactor#UseAdd()<CR>                                                                          

" phpactor jump to reference                                                                                           
autocmd FileType php nnoremap <C-]> :call phpactor#GotoDefinition()<CR>
autocmd FileType typescript nnoremap <C-]> :ALEGoToDefinition<CR>
autocmd FileType javascript nnoremap <C-]> :ALEGoToDefinition<CR>
nnoremap <S-LeftMouse> :call phpactor#GotoDefinition()<CR>                                                             

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
colorscheme onedark                                                                                                    

" prevent lines from wrapping                                                                                          
set nowrap                                                                                                             

" connect with system clipboard                                                                                        
set clipboard+=unnamed                                                                                                 

let g:phpactorPhpBin = 'php'                                                                                           
let g:phpactorBranch = 'develop'                                                                                       
let g:phpactorOmniAutoClassImport = v:true                                                                             
let g:phpactorInputListStrategy = 'phpactor#input#list#fzf'

" Example of implementation with vim's inputlist() function
function! InputListCustomStrategy(label, choices, ResultHandler)
    echo a:label                                                                                                       
    let choice = inputlist(s:add_number_to_choices(a:choices))

    if (choice == 0)                                                                                                   
        throw "cancelled"                                                                                              
    endif                                                                                                              

    call a:ResultHandler(a:choices[choice - 1])                                                                        
endfunction                                                                                                            

let g:phpactorCustomInputListStrategy = 'InputListCustomStrategy'

" deoplete                                                                                                             
" let g:deoplete#enable_at_startup = 1                                                                                 
" let g:deoplete#sources = {}                                                                                          
" let g:deoplete#sources.php = ['omni', 'phpactor']                                                                    
" let g:deoplete#sources.php = ['omni', 'phpactor', 'ultisnips']

" debugging                                                                                                            
" let g:vdebug_options = {'break_on_open': 1}                                                                          
let g:vdebug_options = {'server': 'localhost'}                                                                         
let g:vdebug_options = {'port': '9090'}                                                                                
" \"/srv/www/": "/Users/martinstuessy/Code/admin-tool"                                                                 
let g:vdebug_options.path_maps = {                                                                                     
    \"/srv/www/": "/Users/martinstuessy/Code/api3"                                                                     
\}                                                                                                                     

" point to typescript executable                                                                                       
let $PATH=$PATH . ':/usr/local/Cellar/node/13.3.0/bin'                                                                 
