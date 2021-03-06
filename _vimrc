" =============================================================================
" NO COMPATIBILITY
" =============================================================================
" no compatibility to venerable old Vi
set nocompatible

" =============================================================================
" PATHOGEN
" =============================================================================
" Disabled plugin
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'vim-coffee-script')
call add(g:pathogen_disabled, 'neocomplcache')
" Infect
execute pathogen#infect()
" Generate helptags
execute pathogen#helptags()

" =============================================================================
" SET THE GUI COLOR SCHEME
" =============================================================================
if has("gui_running")
  set background=dark
  color base16-tomorrow                               
endif

" =============================================================================
" CHECK OS
" =============================================================================
if has('win32') || has('win64')
  source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin
  set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\:h9
  au GUIEnter * simalt ~n
elseif has('macunix')
  "set transparency=5
  "au GUIEnter * set fullscreen
  "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\:h11
  set fuoptions=maxvert,maxhorz
  set guifont=Hack\:h11
elseif has('unix')
  "source $VIMRUNTIME/vimrc_example.vim
  "source $VIMRUNTIME/mswin.vim
  "set lines=999 columns=999
  "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9 
  set guifont=Hack\ 9
endif

" =============================================================================
" SETTINGS
" =============================================================================
" GUI options
set guioptions=aAce                         

" Enable filetype detection
filetype on                                 

" Enable filetype-specific indenting
filetype indent on                          

" Enable filetype-specific plugins
filetype plugin on                          

" Syntax highlighting
syntax on									                  

" Set cursor position
au WinLeave * set nocursorcolumn
au WinEnter * set cursorcolumn
" jump to the last known cursor position
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Show the statusline
set laststatus=2                            

" Numero riga
set nu                                      

" treat all numbers as decimals (1 - 10)
set nrformats=

" allow hidden buffer
set hidden                                

" Row after cursor
set so=10                                   

" Open vertical splits to the right
set splitright                              

" Open horizontal splits to the bottom
set splitbelow                              

" Start search from the beginning
set wrapscan                                

" set the character encoding
set encoding=utf-8

" set fileformat
set fileformat=unix

" No backups, swap or viminfo
set nobackup
set nowritebackup
set noswapfile 
set viminfo="NONE"

" no automatically save on buffer switch
set noautowrite

" Mouse enabled
set mouse=a                                 

" normal backspace key functionality
set backspace=indent,eol,start whichwrap+=<,>,[,]

" use a different bground color after
"set textwidth=80
"set colorcolumn=+1

" highlight the column the cursor is on
set cursorcolumn

" highlight the line the cursor is on
set cursorline

" no undo files
set noundofile

" tab and indent options 
" N space for tab
set tabstop=2                               
" N space for autoindent
set shiftwidth=2                            
set softtabstop=2
" Use space for a <Tab>.
set expandtab                               
set smarttab                                

" folding options
set foldmethod=indent
set foldlevel=1
set foldnestmax=10
" Open all folds by default
set nofoldenable

" Show command 
set showcmd                                 

" Show close bracket
set showmatch                               

" turn on incremental search
set incsearch                               

" no case sensitive search patterns
set ignorecase                              

" Highlight search results 
set hlsearch                                

" Search with caps - override ignorecase
set smartcase                               

" allow usage of cursor keys when in insert mode
set esckeys

" Copy indent when new row is started with <CR>  o O
set autoindent                              

"maximum number of changes that can be undone
set undolevels=1000 						            

" Store a ton of history (default is 20)
set history=1000  							            

" Display current mode
set showmode								                

" do not use errorbells
set noerrorbells

" insert two spaces after a period when joining two lines
set nojoinspaces

" show window title
set title

" =============================================================================
" WINDOWS BEHAVIOR
" =============================================================================
" backspace in Visual mode deletes selection
vnoremap <BS> d
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP
cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

" =============================================================================
" NERDTREE
" =============================================================================
let NERDTreeShowBookmarks=1

" =============================================================================
" NUMBERS
" =============================================================================
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

" =============================================================================
" VIM-AIRLINE
" =============================================================================
let g:airline_powerline_fonts = 1

" =============================================================================
" SYNTASTIClimittext
" =============================================================================
"let g:syntastic_enable_highlighting = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" =============================================================================
" NEOCOMPLETE
" =============================================================================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.limittext
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#tags#cache_limit_size = 5000000
"let g:neocomplete#force_overwrite_completefunc = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " Inserting <CR> key.
  "return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"if !exists('g:neocomplete#force_omni_input_patterns')
  "let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() limittext?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#disable_runtime_snippets = { '_' : 1, }

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets/'

" =============================================================================
" FILETYPE
" =============================================================================
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
"autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile=1
"autocmd FileType ruby,eruby let g:rubycomplete_use_bundler=1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" =============================================================================
" SUBTYPES
" =============================================================================
" Ruby
augroup ruby_subtypes
  autocmd!
  autocmd BufNewFile,BufRead *.pdf.erb let b:eruby_subtype='html'
  autocmd BufNewFile,BufRead *.pdf.erb set filetype=eruby
augroup END

" Jquery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" =============================================================================
" RAINBOW
" =============================================================================
let g:rainbow_active = 0

" =============================================================================
" VIM-TAGS
" =============================================================================
let g:vim_tags_auto_generate = 1

" =============================================================================
" VIM-RUBOCOP
" =============================================================================
let g:vimrubocop_keymap = 0

" =============================================================================
" HTML-AutoCloseTag
" =============================================================================
if !has('win32') && !has('win64')
  au FileType xhtml,xml so ~/.vim/bundle/HTML-AutoCloseTag/ftplugin/html_autoclosetag.vim
else
  au FileType xhtml,xml so C:\Program Files\Vim\vimfiles\ftplugin\html_autoclosetag.vim
endif

" =============================================================================
" SHORTCUTS
" =============================================================================
"<F1> open help
nmap <F2> :Calendar<CR>
nnoremap <F3> :NumbersToggle<CR>
map <F4> :set list! list? <CR>
" if ctrlp is open <F5> refresh else
nnoremap <F5> :GundoToggle<CR>
nmap <F6> :Errors<CR>
nmap <F7> :NERDTree<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :RainbowToggle<CR>
nmap <leader>bda :bd <C-a> <CR>
nmap <Leader>r :RuboCop<CR>

" =============================================================================
" DISABLED KEYS
" =============================================================================
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
