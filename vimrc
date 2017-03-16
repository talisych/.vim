let iCanHazneobundle=1
let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
  echo "Installing neobundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  let iCanHazneobundle=0
endif

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('$HOME/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Valloric/YouCompleteMe'
"NeoBundle 'Valloric/YouCompleteMe', {
"     \ 'build' : {
"     \     'mac' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
"     \     'unix' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
"     \     'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
"     \     'cygwin' : './install.sh --clang-completer --system-libclang --omnisharp-completer'
"     \    }
"     \ }
"
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'wesleyche/SrcExpl'
" NeoBundle 'Raimondi/delimitMate'
" NeoBundle 'chazy/cscope_maps'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
" NeoBundle 'Yggdroot/indentLine'
" NeoBundle 'Valloric/ListToggle'
" NeoBundle 'bling/vim-bufferline'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

"Google-color-setting--------------------------
syntax enable
set t_Co=256
"set background=dark
"let g:solarized_termcolors=256
"colorscheme primary
"colorscheme 256-jungle
colorscheme harlequin
"colorscheme solarized

"YouCompleteMe setting------------------------
let g:ycm_disable_for_files_larger_than_kb = 100
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
"mapping
"nmap <leader>gd :YcmDiags<CR>
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Auto change tab type when edit makefile-------
let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk" || _curfile =~ ".*\.dts*"
set noexpandtab
else
set expandtab
set tabstop=4
set shiftwidth=4
endif
"End aotu change tab type


"Genernal Seting------------------------------
"
" set nu
set relativenumber
set nocompatible
set fileencoding=utf-8
set enc=utf-8
set mouse=a
highlight ColorColumn ctermbg=235 guibg=#2c2d27
" let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")
set list lcs=tab:\|˰,trail:~
" Auto rmove trailing whitespace
" autocmd BufWritePre * :%s/\s\+$//e

"hotkey---------------------------------------
"
" map <F8>  :SrcExplToggle <CR>
map <F9>  :TagbarToggle  <CR>
map <F10> :NERDTree      <CR>

" hot key for switch tab/buffer---------------
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

nmap <leader>T :enew<cr>
nmap <leader> <C>

" set hidden
"tagbar---------------------------------------
"
let g:tagbar_left = 1
let g:tagbar_singleclick = 1
" let g:tagbar_autoshowtag = 1
" let g:tagbar_show_visibility = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"
" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
"
" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"NERDTree-------------------------------------
"
let g:NERDTreeWinPos = 'right'

"indentLine------------------------------------------------
"let g:indentLine_char = 'c'
let g:indentLine_color_term = 239
let g:indentLine_concealcursor = 'vc'
let g:indentLine_conceallevel = 2
let g:indentLine_leadingSpaceChar = '˰'
let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_fileType = ['c', 'h']
                                        "test line
"---------------------SrcExpl---------------------
"
" Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8

" Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" Set "Enter" key to jump into the exact definition context
" let g:SrcExpl_jumpKey = "<ENTER>"

" Set "Space" key for back from the definition context
" let g:SrcExpl_gobackKey = "<SPACE>"

" In order to avoid conflicts, the Source Explorer should know what plugins
" except itself are using buffers. And you need add their buffer names
" into below listaccording to the command \":buffers!\"
let g:SrcExpl_pluginList = [
      \ "__Tag_List__",
      \ "_NERD_tree_",
      \ "Source_Explorer",
      \ "__YouCompleteMe__"
      \  ]

" Enable/Disable the local definition searching, and note that this is not
" guaranteed to work, the Source Explorer doesn't check the syntax for now.
" It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" create/update the tags file
" let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" Set "<F12>" key for updating the tags file artificially
" let g:SrcExpl_updateTagsKey = "<F12>"

" Set "<F3>" key for displaying the previous definition in the jump list
" let g:SrcExpl_prevDefKey = "<F3>"

" Set "<F4>" key for displaying the next definition in the jump list
" let g:SrcExpl_nextDefKey = "<F4>"

" Auto highlight
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
        au!
        au CursorHold * let @/ ='\V\<'.escape(expand('<cword>'),'\').'\>'
        augroup end
        setl updatetime=500
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE:
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE:
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    " if filereadable("cscope.out")
    "    cs add cscope.out
    " else add the database pointed to by environment variable
    " elseif $CSCOPE_DB != ""
    "    cs add $CSCOPE_DB
    " endif

    " show msg when any other cscope db added
    " set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-]>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-]>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-]>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-]>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-]>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-]>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-]>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-]>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-]><C-]>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-]><C-]>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-]><C-]>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-]><C-]>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-]><C-]>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-]><C-]>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-]><C-]>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-]><C-]>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif
