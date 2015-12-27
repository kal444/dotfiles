" .vimrc file
" Author: Kyle Huang <kyle@yellowaxe.com>

" When started as "evim", evim.vim will be used. It's easy mode
if v:progname =~? "evim"
  finish
endif

if has("win32") || has("win64")
    let osys="windows"
    let $vimrc=$VIM."\\.vimrc"
    let $notes=""
else
    let osys=system('uname -s')
    let $vimrc=$HOME."/.vimrc"
    let $notes=""
endif

" ========================================================================
" SETTINGS
" ========================================================================
set nocompatible " don't want to be compatible with old VI, use full VIM

" ========================================================================
" ==== File handling
" ========================================================================
set autoread " read the file again when it's changed outside vim and not inside vim
set autowrite " write file when :next, :rewind, :last, :first, :previous, :stop, :suspend, :tag, :!, :make commands are used
set hidden " keep the changed buffer without saving it
set nobackup " backups are for wimps  ;-)
set writebackup " make a backup before overwriting a file. then remove it after the file was successfully written

" ========================================================================
" ==== Editting and stuff
" ========================================================================
set backspace=indent,eol,start " this is much smarter. back over autoindent,<EOL> and insert position
set esckeys " allow cursor movement in insert mode
set formatoptions+=tcq2 " make sure some person format options are set
set history=50 " keep 50 commands and 50 search patterns in the history.
set incsearch " display the match for a search pattern when halfway typing it
set laststatus=2 " always show status line
set ignorecase " do ignore case in search patterns
set report=0 " report all changes
set ruler " show cursor position always
set showcmd " show current uncompleted command
set showmatch " show matching bracket briefly
set showmode " show the current mode
set smartcase " ignore case when the pattern contains lowercase letters only
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [LEN=%L]
set whichwrap=<,> " allow left, right keys to wrap in normal/visual mode

" ========================================================================
" ==== Misc.
" ========================================================================
set noerrorbells " disable error bell beep
set visualbell " use visual bell, but we will disable it later
set t_vb= " disable visualbell terminal chars
set background=dark " use the dark bg color set
set cursorline " makes cursor easier to find
set nocursorcolumn " don't make cursor TOO easy to find
set lazyredraw " don't update screen while executing macros, registers and other commands that have not been typed
set nomodeline " don't allow modelines
set number " do show line numbers
set shortmess=atI " abbreviate all messages
set title " have vim try to update the title of the window
set ttyfast " we are on a fast connection
set virtualedit=all " allow cursor movement anywhere
set wildchar=<Tab> " use tab to start wildcard expansion in the command-line
set wildmenu " makes tab completion better at cmdline

" ========================================================================
" ==== TABS and SPACES
" ========================================================================
set expandtab " use only spaces instead of tabs
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=8

" ========================================================================
" ==== FOLDING         
" ========================================================================
set foldenable " turn on folding
set foldmethod=indent " make folding indent sensitive
set foldlevel=100 " don't autofold anything (but I can still fold manually)
set foldopen-=search " don't open folds when you search into them
set foldopen-=undo " don't open folds when you undo stuff

" ========================================================================
" ==== CTags / taglist plugin
" ========================================================================
let Tlist_Ctags_Cmd = 'C:\_dev\utils\ctags\ctags.exe' " location of the ctags command
let Tlist_Sort_Type = "name" " sort by name
let Tlist_Use_Right_Window = 1 " put tag window on the right
let Tlist_GainFocus_On_ToggleOpen = 1 " switch to tag window when it's opened
let Tlist_Close_On_Select = 0 " close tag window when a tag is selected
let Tlist_Exit_OnlyWindow = 1 " exit vim when only tag window left

" ========================================================================
" ==== MAPPING
" ========================================================================
vnoremap p <Esc>:let current_reg = @"<cr>gvdi<c-r>=current_reg<cr><Esc> " p in visual mode replace the selected text with the "" register.
 noremap Q gq " don't use Ex mode, use Q for formatting
 noremap <c-w><c-e> <c-w><c-w><c-w>_<cr> " switch to the other window ala ^w^w, but maximize the target window too
nnoremap <silent> <F3> :NERDTreeToggle<CR> " use F$3 to toggle NERDTree window
nnoremap <silent> <F4> :TlistToggle<CR> " use F4 to toggle tag window
nnoremap <silent> <F5> :MiniBufExplorer<CR> " use F5 to open buffer explorer window
nnoremap <silent> <F6> :BufExplorer<CR> " use F6 to open buffer explorer window

nnoremap ,rcm :%s/<c-v><c-m>//g<cr> " rcm = remove ^M from DOS file

 noremap ,cel :g/^[<c-i> ]*$/d<cr> " cel = clear empty lines - deletes all empty or whitespace only lines
  ounmap ,cel

nnoremap ,ss :/ /<cr> " ss = show space - highlight all spaces
nnoremap ,st :/<c-i>/<cr> " st = show tabs - highlight all tabs
nnoremap ,sts :/ \{1,\}$/<cr> " sts = show trailing spaces - highlight all trailing spaces

 noremap ,sl :g/^$/-j<cr> " sl = squeeze lines - turns a block of empty lines into *one* empty line
  ounmap ,sl

" executes the command on the line, it will start executing from the first normal character
nnoremap ,run 0/[a-zA-Z0-9]<c-m>y$:r !<c-r>y

" ========================================================================
" VIMRC - Editing and updating the vimrc:
" As I often make changes to this file I use these commands to start editing it and also update it:
" ========================================================================
noremap ,v :exe ":edit " . $vimrc<cr> " ,v = ~/.vimrc editing (edit this file)
noremap ,u :exe ":source " . $vimrc<cr> " ,u = update by reading this file

" ========================================================================
" ==== All the rest
" ========================================================================
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " change the current directory to the one a file I open is in
  autocmd BufRead * lcd %:p:h

  autocmd BufNewFile,BufRead *.textile,*.txtl set filetype=textile
  autocmd BufNewFile,BufRead *.clojure,*.clj set filetype=clojure
  autocmd BufNewFile,BufRead *.as set filetype=actionscript
  autocmd BufNewFile,BufRead *.markdown,*.mkd set filetype=mkd

  autocmd GUIEnter * set visualbell t_vb= " disable screen flashing AND bells in GUI

  augroup END
else
  set autoindent " always set autoindenting on
  set smartindent " always set smartindent on
  set textwidth=0 " disables forced wrapping
endif " has("autocmd")

if has("gui_running")
    behave xterm
    set mousehide " hide the mouse when typing
    set lines=50 " default to 50 lines
    set columns=132 " default to 132 columns

    if has("win32") || has("win64")
        set guifont=DejaVu_Sans_Mono:h10:cANSI
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif

    " Make shift-insert work like in Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>

    " Only do this for Vim version 5.0 and later.
    if version >= 500
        " Set nice colors for basic non-syntax files
        " background for normal text is light grey
        " Text below the last line is darker grey
        " Cursor is green, Cyan when ":lmap" mappings are active
        " Constants are not underlined but have a slightly lighter background
        highlight Normal guibg=grey90
        highlight Cursor guibg=Green guifg=NONE
        highlight lCursor guibg=Cyan guifg=NONE
        highlight NonText guibg=grey80
        highlight Constant gui=NONE guibg=grey95
        highlight Special gui=NONE guibg=grey95

        " overwrite the colors with this
        colorscheme herald
     endif " version >= 500
endif " has(gui)

