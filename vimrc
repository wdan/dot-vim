" ----------------------------------------
" Vundle
" ----------------------------------------
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off     " required!

let g:vundle_default_git_proto='https'
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/vim-golang/
call vundle#rc()

" let Vundle manage Vundle. required! 
Bundle 'gmarik/vundle'

" ---------------
" Plugin Bundles
" ---------------
" Theme
"Bundle 'altercation/vim-colors-solarized'
" Search
Bundle 'rking/ag.vim'
" Navigation
Bundle 'scrooloose/nerdtree'
Bundle 'FuzzyFinder'
Bundle 'a.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'taglist.vim'
Bundle 'majutsushi/tagbar'
"Bundle 'humiaozuzu/TabBar'
Bundle 'cscope_macros.vim'
Bundle 'Lokaltog/vim-easymotion'
" UI Additions
"Bundle 'Yggdroot/indentLine'
Bundle 'dickeyxxx/status.vim'
Bundle 'bling/vim-airline'
"Bundle 'Lokaltog/vim-powerline'
" Commands
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
" Automatic helpers
Bundle 'Valloric/YouCompleteMe'
Bundle 'plasticboy/vim-markdown'
Bundle 'def-lkb/vimbufsync'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'tpope/vim-sensible'
Bundle 'Shougo/neocomplcache'
"Bundle 'rkulla/pydiction'
Bundle 'avsm/ocaml-annot'
" SnipMate
Bundle "SirVer/ultisnips"
"Bundle "garbas/vim-snipmate"
" SnipMate Depedancies
"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"
"Bundle "snipmate-snippets"
" Language Additions
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-rvm'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tangledhelix/vim-octopress'
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
" Libraries
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'tpope/vim-repeat'
Bundle 'L9'
Bundle 'genutils'

" Automatically detect file types. (must turn on after Vundle)
filetype on
filetype indent on
filetype plugin on

" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------

if has('win32') || has('win64')
  " Windows
  source $VIMRUNTIME/mswin.vim
  set guifont=Consolas:h11:cANSI
  set guioptions-=T " Toolbar
  set guioptions-=m " Menubar

  " Set height and width on Windows
  set lines=60
  set columns=120

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has('gui_running')
  if has("gui_macvim")
    set guifont=Monaco:h11
    " e: tab page, g: gray menu, m: menu bar, t: tearoff menu items
    set guioptions=egmt
    " commands like yy will directly put content into mac clipboard
    "set clipboard=unnamed
  endif
  winsize 90 45
endif

" ----------------------------------------
" Regular Vim Configuartion (No Plugins Needed)
" ----------------------------------------

set exrc
set secure

" ---------------
" Color
" ---------------
set t_Co=256 " XXX This has problem on real terminal, fix it
"colorscheme inkpot
"colorscheme cobalt
"set background=dark
"colorscheme solarized
colorscheme monokai

" ---------------
" File encodings
" ---------------
set fileencodings=utf-8,gbk "ucs-bom,ucs-4

" ---------------
" Backups
" ---------------
set backup
set backupdir=~/.vim/data/backup
set directory=~/.vim/data/swap

" ---------------
" UI
" ---------------
set modelines=5
set ruler " show the cursor position all the time
set nu
set wrap " wrap long text when displaying
set laststatus=2
set fen  " Enable folding, I find it very useful
set fdl=0

"set cmdheight=2
"set list
" :dig for more symbols
"set listchars=tab:»·,trail:·
" ---------------
" Behaviors
" ---------------
syntax on
set shortmess=atI
set hidden " allow change to buffer while modified
set wildmenu
set cf
set history=100
set showcmd " display incomplete commands
set autowrite " Writes on make/shell commands
set wildignore+=*.o,*.obj,.git
set scrolloff=7 " Always keep 5 lines above/below the cursor
set timeoutlen=250 " Time to wait for a command (after Leader for example)

" ---------------
" Text Format
" ---------------
set autoread
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set shiftwidth=4  " Tabs under smart indent
set cindent
set autoindent
set smartindent " Smart indet
set smarttab
set textwidth=80
" for better formatting for multi-byte characters
set formatoptions+=tcqMm

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase " Non-case sensitive search
set incsearch
set hlsearch

" ---------------
" Visual
" ---------------
set wildmenu
set cursorline
set showmatch  " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
if has('mouse')
  set mousehide  " Hide mouse after chars typed
  set mouse=a  " Mouse in all modes
end

" Better complete options to speed it up
set complete=.,w,b,u,U

" ----------------------------------------
" Bindings
" ----------------------------------------

let mapleader=","

" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Fixes common typos
command W w
command Q q
abbreviate teh the

" Make line completion easier
imap <C-l> <C-x><C-l>

imap <Leader>q <Esc>
map <F5> :make
map <F7> :cnext
map [[ :w

" Quickfix map
map <leader>cj :cn<CR>
map <leader>ck :cp<CR>

"Auto cscope and ctags 
nmap <F3> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -Rbkq -i cscope.files -f cscope.out<CR>
  \:!ctags -R<CR>
  \:cs reset<CR>

" Jump to the exact location of the mark
nmap ' `
nnoremap ; :
nnoremap j gj
nnoremap k gk

" Switch on spell
nmap <silent> <Leader>s :setlocal spell!<CR>
nmap <silent> <Leader>v :e ~/.vimrc<CR>
set pastetoggle=<Leader>p

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Don't use Ex mode, use Q for formatting
nmap Q gqap
vmap Q gq

" In case forget to use sudo vim
cmap w!! w !sudo tee % >/dev/null

" ctrl + k to move over the last pair
"inoremap ( ():let leavechar=")"i
"inoremap [ []:let leavechar="]"i
"inoremap " "":let leavechar="\""i
"inoremap <C-k> :exec "normal f" . leavechara

" ----------------------------------------
" Auto Commands
" ----------------------------------------

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" cpp, java specific abbreviation
"autocmd filetype c,cpp,java set shiftwidth=8 | set ts=8 | set noexpandtab
noremap ( ()<Esc>i)
autocmd filetype c,cpp,java set shiftwidth=4 | set ts=4 | set expandtab
autocmd filetype c,cpp abbreviate #i #include
autocmd filetype c,cpp abbreviate #d #define
autocmd filetype c,cpp abbreviate #e #endif
"autocmd filetype c,cpp set list | set listchars=tab:»·,trail:·
autocmd filetype c,cpp,java,go inoremap{ {<CR>}<Esc>ko
autocmd filetype ruby setlocal shiftwidth=2 | setlocal ts=2 | setlocal expandtab
autocmd filetype help setlocal nonu
autocmd filetype html setlocal ts=4 | setlocal sw=4 | setlocal softtabstop=4 | setlocal expandtab
autocmd filetype python setlocal expandtab | setlocal shiftwidth=4 | setlocal tabstop=4 | setlocal softtabstop=4
autocmd filetype tex setlocal ts=4 | setlocal sw=4 | setlocal softtabstop=4 | setlocal expandtab
autocmd filetype lua setlocal ts=2 | setlocal sw=2 | setlocal softtabstop=2 | setlocal expandtab
autocmd filetype sh setlocal ts=4 | setlocal sw=4 | setlocal softtabstop=4 | setlocal expandtab
autocmd filetype srt setlocal ts=4 | setlocal sw=4 | setlocal softtabstop=4 | setlocal expandtab
autocmd filetype vim setlocal ts=2 | setlocal sw=2 | setlocal expandtab
autocmd filetype markdown setlocal ts=2 | setlocal sw=2 | setlocal expandtab
autocmd filetype ocaml setlocal shiftwidth=2| setlocal ts=2| setlocal sw=2 | setlocal expandtab
autocmd filetype go setlocal ts=4 | setlocal sw=4 | setlocal noexpandtab
autocmd filetype go setlocal makeprg=gomake

" CPC
au BufNewFile,BufRead *.cpc setf c
au BufNewFile,BufRead *.cpc syn keyword cType cps
au BufNewFile,BufRead *.cpc syn keyword cStatement cpc_spawn cpc_detached cpc_attached

" ----------------------------------------
" Misc.
" ----------------------------------------

" ---------------
" cscope
" ---------------
set csprg=/usr/local/bin/cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-c>c :cs find c <C-R>=expand("<cword>")<CR><CR> 
nmap <C-c>s :cs find s <C-R>=expand("<cword>")<CR><CR> 
nmap <C-c>d :cs find d <C-R>=expand("<cword>")<CR><CR> 
nmap <C-c>g :cs find g <C-R>=expand("<cword>")<CR><CR> 
nmap <C-c>t :cs find t <C-R>=expand("<cword>")<CR><CR> 
nmap <C-c>f :cs find f <C-R>=expand("<cword>")<CR><CR> 
nmap <C-c>i :cs find i <C-R>=expand("<cword>")<CR><CR> 
" ---------------
" netrw
" ---------------
let g:netrw_list_hide='^\.[^.]\+'

" ---------------
" Expand current file's path
" ---------------

" learned from "Vim Tip of the day"
" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
" (thanks Douglas Potts)
if has("unix")
    map ,e :e <C-R>=expand("%:p:h") . "/"<CR>
else
    map ,e :e <C-R>=expand("%:p:h") . "\" <CR>
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

" ---------------
" Utilsnaps 
" ---------------
if has('python')
  let g:UltiSnipsExpandTrigger = "<tab>"
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
  let g:UltiSnipsSnippetDirectories = ["snippets"]
else
  call add(g:pathogen_disabled, 'ultisnips')
endif

" ---------------
" ocaml-annot 
" ---------------
function! OCamlType()
  let col  = col('.')
  let line = line('.')
  let file = expand("%:p:r")
  echo system("annot -n -type ".line." ".col." ".file.".annot")
endfunction    
map .t :call OCamlType()<return>

" ---------------
" dash 
" ---------------
:nmap <silent> <leader>a <Plug>DashSearch
let g:dash_map = {
      \ 'ruby'       : 'ruby',
      \ 'python'     : 'python2',
      \ 'javascript' : 'backbone',
      \ 'go'         : 'go',
      \ 'c'          : 'c',
      \ 'java'       : 'java7',
      \ 'cpp'        : 'cpp',
      \ 'scala'        : 'scala',
      \ 'php'        : 'php',
      \ }

" ---------------
" pydiction 
" ---------------
"let g:pydiction_location ='~/.vim/bundle/pydiction/complete-dict'
"let g:pydiction_menu_height = 20

" ---------------
" ag.vim 
" ---------------
let g:airline_theme="bubblegum"

" ---------------
" ag.vim 
" ---------------
let g:agprg="/usr/local/bin/ag --column"

" ---------------
" ctrl.p
" ---------------

nnoremap <silent> <Leader>f :CtrlPCurWD<CR>
nnoremap <silent> <Leader>m :CtrlPBuffer<CR>

" ---------------
" Tabbar 
" ---------------
 nmap <Leader>k :bd<CR>:bn<CR>

" ---------------
" Tagbar 
" ---------------
nmap <F4> :TagbarToggle<CR>

" ---------------
" SuperTab
" ---------------
" Set these up for cross-buffer completion (something Neocachecompl has a hard
" time with)
"let g:SuperTabDefaultCompletionType = "<leader><tab>"
"let g:SuperTabContextDefaultCompletionType = "<leader><tab>"

" ---------------
" Neocachecompl
" ---------------
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_auto_select=1 "Select the first entry automatically
let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_cursor_hold_i_time=300
let g:neocomplcache_auto_completion_start_length=1

" -----------------
" manpageview
" -----------------
let g:manpageview_winopen="hsplit="

" -----------------
" Markdown
" -----------------
let g:vim_markdown_folding_disabled=1

" -----------------
" LaTeX-suite
" -----------------
set grepprg=grep\ -nH\ $*
"call IMAP('EFM', '\begin{frame}    \frametitle{}\end{frame}', 'tex')
"au filetype tex imap <buffer> <M-TAB> <Plug>Tex_Completion

" -----------------
" NERD commenter
" -----------------
let NERDShutUp = 1

" -----------------
" NERD Tree 
" -----------------
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <Leader>n :NERDTreeToggle<CR>

" -----------------
" Haskell mode
" -----------------
" use ghc functionality for haskell files
autocmd filetype haskell set ts=4
au Bufenter *.hs compiler ghc
let g:haskell_indent_if=4

" -----------------
" taglist
" -----------------
let g:Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
nnoremap <silent> <F8> :TlistToggle<CR>
let g:Tlist_Show_One_File=1
let g:Tlist_Use_Right_Window=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Inc_Winwidth=1

" -----------------
" status
" -----------------
let g:statusline_fugitive = 1
let g:statusline_rvm=0
let g:statusline_syntastic=0
let g:statusline_enabled=1
let g:statusline_fullpath=0

" Everything must be after Right Separator for BufStat
let g:statusline_order=[
      \ 'Filename',
      \ 'Encoding',
      \ 'Help',
      \ 'Filetype',
      \ 'Modified',
      \ 'Fugitive',
      \ 'RVM',
      \ 'TabWarning',
      \ 'Syntastic',
      \ 'Paste',
      \ 'ReadOnly',
      \ 'RightSeperator',
      \ 'CurrentHighlight',
      \ 'CursorColumn',
      \ 'LineAndTotal',
      \ 'FilePercent']

" -----------------
" FuzzyFinder
" -----------------
let g:fuf_modesDisable=['mrucmd'] " Enables FufMruFile
"nnoremap <C-s> :FufBuffer<CR>
nnoremap <silent>s<C-s> :FufFileWithCurrentBufferDir<CR>
"nnoremap <silent><C-y> :FufMruFile<CR>
nnoremap <Leader>ff :FufFile<CR>
nnoremap <Leader>fm :FufMruFile<CR>

" ---------------
" Session
" ---------------
let g:session_autosave=1
let g:session_autoload=0
nnoremap <Leader>os :OpenSession<CR>

" ---------------
" Vundle
" ---------------
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bi! :BundleInstall!<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>

" Search Dash for word under cursor

"function! SearchDash()
"  let s:browser = "/usr/bin/open"
"  let s:wordUnderCursor = expand("<cword>")
"  let s:url = "dash://".s:wordUnderCursor
"  let s:cmd ="silent ! " . s:browser . " " . s:url
"  execute s:cmd
"  redraw!
"endfunction
"map <leader>sd :call SearchDash()<CR>

"" ---------------
" Kwbd
" ---------------
nnoremap <Leader>d :Kwbd<CR>

" ---------------
" YouCompleteMe
" ---------------
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion = ['<leader><tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-TAB>', '<Up>']

  let g:ycm_filetype_blacklist = {
        \ 'notes' : 1,
        \ 'markdown' : 1,
        \ 'text' : 1,
        \ 'python': 1,
        \}

" ---------------
" Syntastic
" ---------------

let g:syntastic_mode_map={ 'mode': 'passive',
                         \ 'active_filetypes': ['ruby', 'python', 'ocaml', 'java', 'go', 'javascript'],
                         \ 'passive_filetypes': ['c'] }
let g:syntastic_ruby_checkers=['rubocop']

" ---------------
" Merlin
" ---------------
"let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') .  "/ocamlmerlin"
:set rtp+=/Users/dan/.opam/4.01.0/share/ocamlmerlin/vim
:set rtp+=/Users/dan/.opam/4.01.0/share/ocamlmerlin/vimbufsync

" ---------------
" EasyMotion
" ---------------

let g:EasyMotion_mapping_f='f'
let g:EasyMotion_mapping_F='F'

" ---------------
" whitespace
" ---------------
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" ---------------
" ocp-indent
" ---------------
autocmd FileType ocaml source /Users/dan/.opam/4.01.0dev+trunk/share/typerex/ocp-indent/ocp-indent.vim
au BufEnter *.ml setf ocaml
au BufEnter *.mli setf ocaml
au FileType ocaml call FT_ocaml()
syntax on
function FT_ocaml()
  set textwidth=80
  set colorcolumn=80
  set shiftwidth=2
  set tabstop=2
  " ocp-indent with ocp-indent-vim
  let opamshare=system("opam config var share | tr -d '\n'")
  execute "autocmd FileType ocaml source".opamshare."/vim/syntax/ocp-indent.vim"
  filetype indent on
  filetype plugin on
  syntax on
endfunction
