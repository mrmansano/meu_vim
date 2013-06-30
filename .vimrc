" Básico {
set noexrc
set cpoptions=aABceFsmq
set mouse=a
syntax on
set encoding=utf-8
"set lines=80
"set columns=270
" }

" Geral {
filetype plugin indent on
"set autochdir
set nocp
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/tmp
set fileformats=unix,dos,mac
set hidden 
set wildmenu	
" }

" Vim UI {
set t_Co=256
""set t_Co=16
""let g:solarized_termcolors=16
"let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
""set background=dark
"colorscheme aldmeris	
"colorscheme solarized 
"colorscheme molokai  
"colorscheme ambient
"colorscheme darkspectrum " ----+> Favorito 
"colorscheme pyte 
""colorscheme mustang
"colorscheme gentooish 
"colorscheme native 
"colorscheme no_quarter 
"colorscheme jellybeans
"colorscheme zenburn 
"colorscheme kellys
"colorscheme mac_classic 
colorscheme github
"set cursorcolumn
set cursorline
set incsearch
set laststatus=2
set lazyredraw
set nolist
set lcs=tab:→\ ,trail:∙,extends:>,precedes:<,nbsp:\&
"set listchars=tab:>-,trail:-
set matchtime=5
set hlsearch
set number
set numberwidth=5
set report=0
set ruler
set showmatch
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set tabpagemax=15
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
" delete current word, insert and normal modes
inoremap <C-BS> <C-O>b<C-O>dw
noremap <C-BS> bdw
"nmap <silent> <C-W> :set list <CR>
"nmap <silent> <C-Q> :set nolist <CR>
set ttyscroll=0
" }

" Texto {
set shiftwidth=8
set softtabstop=4
set tabstop=8
" }

" Dobramento {
set foldcolumn=0
set foldenable
set foldlevel=0
set foldmethod=marker
""set foldtext=FoldText()
""set foldenable
""set foldmarker={,}
""set foldmethod=marker
""set foldlevel=100
""set foldopen=block,hor,mark,percent,quickfix,tag

function SimpleFoldText() " {
	return getline(v:foldstart).' '
endfunction " }
set foldtext=SimpleFoldText()
" }

" Opções de Plugins {
" Taglist {
let Tlist_Auto_Open=0
let Tlist_Compact_Format=1
let Tlist_Ctags_Cmd='ctags'
let Tlist_Enable_Fold_column=0
let Tlist_Exist_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=0
let Tlist_Sort_type="name"
let Tlist_Use_Right_Window=0
let Tlist_WinWidth=40
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" }
" }

" Fonte {
if has("gui_running")
	if has("gui_gtk2")
		"set guifont=Courier\ 10\ Pitch\ 9 
		set guifont=DejaVu\ Sans\ Mono\ 9
		set nolist
		set showtabline=2
	elseif has("gui_win32")
		set guifont=Consolas:h11:cANSI
	endif
endif
" }

" CScope {
if has("cscope")

	""""""""""""" Standard cscope/vim boilerplate

	" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'<M-F12>
	set cscopetag

	" check cscope for definition of a symbol before checking ctags: set to 1
	" if you want the reverse search order.
	set csto=0

	" add any cscope database in current directory
	if filereadable("cscope.out")
		cs add cscope.out  
		" else add the database pointed to by environment variable 
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif

	" show msg when any other cscope db added
	set cscopeverbose  


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

	nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
	nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
	nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
	nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


	" Hitting CTRL-space *twice* before the search type does a vertical 
	" split instead of a horizontal one (vim 6 and up only)
	"
	" (Note: you may wish to put a 'set splitright' in your .vimrc
	" if you prefer the new window on the right instead of the left

	nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
	nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
	nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


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
	" pe:rsonally, I find a tenth of a second to work well for key code
	" timeouts. If you experience problems and have a slow terminal or network
	" connection, set it higher.  If you don't set ttimeoutlen, the value for
	" timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
	"
	"set ttimeoutlen=100

endif
" }

" NERDtree {
"autocmd VimEnter * NERDTree
nnoremap <silent> <F3> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>i
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.ii', '\.d', '\.o']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1 
let NERDChristmasTree=1 
" }

" Gvim {
"if has("gui_running")
"	set fuoptions=maxvert,maxhorz
"	au GUIEnter * set fullscreen
"endif
" } 

" TagList {
"F4: Switch on/off TagList
nnoremap <silent> <F4> :TlistToggle<CR>
" TagListTagName - Used for tag names
"highlight MyTagListTagName gui=bold guifg=Black guibg=Orange
" TagListTagScope - Used for tag scope
"highlight MyTagListTagScope gui=NONE guifg=Blue
" TagListTitle - Used for tag titles
"highlight MyTagListTitle gui=bold guifg=DarkRed guibg=LightGray
" TagListComment - Used for comments
"highlight MyTagListComment guifg=DarkGreen
" TagListFileName - Used for filenames
"highlight MyTagListFileName gui=bold guifg=Black guibg=LightBlue
"let Tlist_Ctags_Cmd = $VIM.'/vimfiles/ctags.exe' " location of ctags tool
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the
" taglist window.
let Tlist_Compart_Format = 1    " Remove extra information and blank lines from
" the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Close_On_Select = 1   " Close the taglist window when a file or tag
" is selected.
let Tlist_Enable_Fold_Column = 0	" Don't Show the fold indicator column in
" the taglist window.
let Tlist_WinWidth = 40
" let Tlist_Ctags_Cmd = 'ctags --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++'
" very slow, so I disable this
" let Tlist_Process_File_Always = 1 " To use the :TlistShowTag and the
"  :TlistShowPrototype commands without the taglist window and the taglist
"  menu, you should set this variable to 1.
":TlistShowPrototype [filename] [linenumber]
"}

" Ctags {
function! UPDATE_TAGS()
	let _f_ = expand("%:p")
	let _cmd_ = '"ctags-exuberant -a -f /dvr/tags --c++-kinds=+p --fields=+iaS --extra=+q " ' . '"' . _f_ . '"'
	let _resp = system(_cmd_)
	unlet _cmd_
	unlet _f_
	unlet _resp
endfunction
autocmd BufWritePost *.cpp,*.h,*.c call UPDATE_TAGS()
"}

" OmniCppComplete {
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window  au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
			\ "\<lt>C-n>" :
			\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
			\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
			\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
" }

" BufferExplorer {
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <C-F5> :BufExplorer<CR>
nnoremap <silent> <F5> :bn<CR>
nnoremap <silent> <S-F5> :bp<CR>
" }

" MiniBufferExplorer {
"Show the miniBufExplorer from the start
"	let g:miniBufExplorerMoreThanOne = 0

"Not using because I don't use the vertival window
"Use a vertical windows
"let g:miniBufExplVSplit = 5

"Put the miniBufExplorer windows at the right
"let g:miniBufExplSplitBelow=1

"Maximum size of the mini buffer explorer window
"let g:miniBufExplMaxSize = 15

"Still haven't discovered what it does
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"
" make tabs show complete (no broken on two lines)
"	let g:miniBufExplTabWrap = 1

" If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
"	let g:miniBufExplModSelTarget = 1

" If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
"	let g:miniBufExplUseSingleClick = 1

"for buffers that have NOT CHANGED and are NOT VISIBLE.
"	highlight MBENormal guifg=LightBlue

" for buffers that HAVE CHANGED and are NOT VISIBLE
"	highlight MBEChanged guifg=Red

" buffers that have NOT CHANGED and are VISIBLE
"	highlight MBEVisibleNormal term=bold cterm=bold gui=bold guifg=Green

" buffers that have CHANGED and are VISIBLE
"	highlight MBEVisibleChanged term=bold cterm=bold gui=bold guifg=Green

"	let g:bufExplorerSortBy = "name"

"	autocmd BufRead,BufNew :call UMiniBufExplorer

"""""""""""""""""""""""""""""""""""
" Stolen from http://dev.gentoo.org/~bass/configs/vimrc.html
"
" Adapt the status line accourding to the window
"""""""""""""""""""""""""""""""""""
"	if has("autocmd")
"	    au FileType qf
"			\ if &buftype == "quickfix" |
"			\     setlocal statusline=%2*%-3.3n%0* |
"			\     setlocal statusline+=\ \[Compiler\ Messages\] |
"			\     setlocal statusline+=%=%2*\ %<%P |
"			\ endif

"	    fun! FixMiniBufExplorerTitle()
"		if "-MiniBufExplorer-" == bufname("%")
"		    setlocal statusline=%2*%-3.3n%0*
"		    setlocal statusline+=\[Buffers\]
"		    setlocal statusline+=%=%2*\ %<%P
"		endif
"	    endfun
"
"	    au BufWinEnter *
"			\ let oldwinnr=winnr() |
"			\ windo call FixMiniBufExplorerTitle() |
"			\ exec oldwinnr . " wincmd w"
"	endif
"	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"
"	" Showmarks {{{
"	""""""""""""""""""""""""""""""
"	if has("gui_running")
"	    let g:showmarks_enable=1
"	else
"	    let g:showmarks_enable=0
"	    let loaded_showmarks=1
"	endif

"	let g:showmarks_include="abcdefghijklmnopqrstuvwxyz"

"	if has("autocmd")
"	    fun! FixShowmarksColours()
"		if has('gui')
"		    hi ShowMarksHLl gui=bold guifg=#a0a0e0 guibg=#2e2e2e
"		    hi ShowMarksHLu gui=none guifg=#a0a0e0 guibg=#2e2e2e
"		    hi ShowMarksHLo gui=none guifg=#a0a0e0 guibg=#2e2e2e
"		    hi ShowMarksHLm gui=none guifg=#a0a0e0 guibg=#2e2e2e
"		    hi SignColumn   gui=none guifg=#f0f0f8 guibg=#2e2e2e
"		endif
"	    endfun
"	    if v:version >= 700
"		autocmd VimEnter,Syntax,ColorScheme * call FixShowmarksColours()
"	    else
"		autocmd VimEnter,Syntax * call FixShowmarksColours()
"	    endif
"	endif
""    let g:miniBufExplModSelTarget = 1
" "   let g:miniBufExplorerMoreThanOne = 2
"  "  let g:miniBufExplModSelTarget = 0
"    let g:miniBufExplUseSingleClick = 1
"    let g:miniBufExplMapWindowNavVim = 1
"    let g:miniBufExplVSplit = 25
"    let g:miniBufExplSplitBelow=1

"    let g:bufExplorerSortBy = "name"

"   autocmd BufRead,BufNew :call UMiniBufExplorer
"    map <silent> <F5> :TMiniBufExplorer<cr> 
" }

" Tabs {
" Movement between tabs OR buffers
nnoremap L :call MyNext()<CR>
nnoremap H :call MyPrev()<CR>

" MyNext() and MyPrev(): Movement between tabs OR buffers
function! MyNext()
	if exists( '*tabpagenr' ) && tabpagenr('$') != 1
		" Tab support && tabs open
		normal gt
	else
		" No tab support, or no tabs open
		execute ":bnext"
	endif
endfunction
function! MyPrev()
	if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
		" Tab support && tabs open
		normal gT
	else
		" No tab support, or no tabs open
		execute ":bprev"
	endif
endfunction
" }
"
" Tab Headings {
function GuiTabLabel() 
	let label = '' 
	let bufnrlist = tabpagebuflist(v:lnum) 

	" Add '+' if one of the buffers in the tab page is modified 
	for bufnr in bufnrlist 
		if getbufvar(bufnr, "&modified") 
			let label = '+' 
			break 
		endif 
	endfor 

	" Add short file name 
	let bufId = bufnrlist[tabpagewinnr(v:lnum) - 1] 
	let fn = bufname(bufId) 
	let lastSlash = strridx(fn, '/') 
	return label . strpart(fn, lastSlash+1, strlen(fn)) 
endfunction 

set guitablabel=%{GuiTabLabel()}
" }

"TaskList {
map <F8>  <Plug>TaskList
" }
"----------------------------------------------------------------------------------------------------------------------
" My Shortcuts

"let g:tex_flavor='latex'

autocmd BufNewFile Makefile r ~/.vim/templates/template_makefile

" Fancy status line {
""let g:Powerline_symbols = 'fancy'
"call Pl#Theme#InsertSegment('git_branch', 'after', 'filename')
let g:Powerline_theme = 'default'
"let g:Powerline_colorscheme='solarizedpatrick'
" Pl#Segment#Modes('!N')}

"Pathogen {
call pathogen#infect()
"}

" Fuzzy Finder {

"}
