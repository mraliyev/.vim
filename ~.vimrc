
"Use latest Vim settings
set nocompatible

"Set plugins file path
let myPluginsFile = '~/.vim/plugins.vim'

"Read/load plugins
execute "so ".myPluginsFile

"Enable syntax highlighting
syntax enable

"Make backspace behave like in other editors
set backspace=indent,eol,start

"The default is \, but this is convenient
let mapleader=','

"Activate line numbers
set number

"Autowrite file when switching buffers
set autowriteall

"Set autocompletion matching
set complete=.,w,b,u

"Set indentation
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set ruler

"Disable '-- INSERT --' etc in status line. 
"(Managed by Lightline plugin)
set noshowmode


"---------------------Visuals----------------------"

"Set terminal colors to 256
set t_Co=256
set background=dark

"Set color scheme (theme have to be placed ~/.vim/colors directory)
colorscheme happy_hacking
" colorscheme deus
" colorscheme PaperColor
" colorscheme afterglow
" colorscheme challenger_deep
" colorscheme github
" colorscheme materialbox
" colorscheme gotham
" colorscheme gotham256
" colorscheme lucius
" colorscheme focuspoint
" colorscheme desert


"Show Matching Parenthesis
set showmatch



"---------------------Search Settings----------------------"

"Highlight search
set hlsearch

"Highlight incremetally while searching
set incsearch



"---------------------Split screen settings----------------------"

"Always set vertical split window right
set splitright

"Always set horizontal split window below
set splitbelow

"Ctrl+L - go to left screen
"nmap <C-L> <C-W><C-H>

"Ctrl+'something' - go to Right screen. Note: Ctrl+R is used by CtrlP plugin
"nmap <C-> <C-W><C-L>



"---------------------Mappings----------------------"

"Open Vimrc file for editing in a new tab
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Open a file in a tab for editing
nmap <Leader>te :tabedit<space>
nmap <Leader>to :tabedit<space>

"Close tab
nmap <Leader>tc :tabc<cr>

"Simple highlight removal
nmap <Leader><space> :nohlsearch<cr>



"---------------------Plugins----------------------"

"Open Plugins file
execute "nmap <Leader>ep :e ".myPluginsFile."<cr>"

"
"CtrlP
"
let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

nmap <C-R> :CtrlPBufTag<cr>
nmap <C-E> :CtrlPMRUFiles<cr>


"
"NERDTree
"
let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden=1


"NERDTree quick access
nmap <C-\> :NERDTreeToggle<cr>

"Change arrows in NERDTree
"let g:NERDTreeDirArrowExpandable = '▸'     "Default - ▸
"let g:NERDTreeDirArrowCollapsible = '▾'    "Default - ▾


"
"GReplace
"
set grepprg=ack
let g:grep_cmd_opts = '--noheading'


"
"UltiSnip
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"


"
"Syntastic
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


"
"Lightline
"
set laststatus=2


"
"vim-php-namespace
"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction


"
"PHP CS Fixer (PSR2)
"

" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@PSR2"              " options: --rules (default:@PSR2)
"let g:php_cs_fixer_cache = ".php_cs.cache"     " options: --cache-file
"let g:php_cs_fixer_config_file = '.php_cs'     " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.


"---------------------Snippets----------------------"
nmap <Leader>es :tabedit ~/.vim/UltiSnips<cr>  



"---------------------Auto-comands----------------------"

"vim-php-namespace autocall
augroup phpnamespace
    autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
augroup END

augroup phpcsfixer
    autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
augroup END

"Automatically source/load Vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost $MYVIMRC source %
augroup END
