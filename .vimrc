"==================================================================
"==========================BASICS==================================
"==================================================================
execute pathogen#infect()

set nocp	"cursors in edit-mode
set backspace=2 "backspace in edit mode
set ignorecase  "ignore case when searching

set sidescroll=20
set scrolloff=10
set sidescrolloff=20

" enable mouse (seems to disable ability to copy (SHIFT-CTRL-C))
" set mouse=a

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
au BufWinLeave *.* mkview
if argc()
	au BufWinEnter *.* silent loadview
endif



"to enable copy and paste via ctrl-c ctrl-v in gvim
"if has("gui_running")	
"	source $VIMRUNTIME/mswin.vim
"	behave mswin
"endif

"windowsize
"set lines=60 columns=120


"Note background set to dark in .vimrc
highlight Normal     guifg=gray guibg=black

"===wordwrap===
set nowrap
set lbr			"Sets linebreak, so words are not split when wrap is on

"=======encoding=======
set fileencoding=latin1
set fileencodings=latin1
set encoding=UTF-8


"=======nice statusline==========
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
"and always display status
set laststatus=2

"=============TABS==============
set autoindent		"autoindention
set smartindent		"autoindention
set shiftwidth=4
set tabstop=4
"set softtabstop=0
"==================================================================
"==============================COLOR===============================
"==================================================================
set background=dark


"==================================================================
"==============================KEYMAPS=============================
"==================================================================

cmap Q q
cmap W w

"clone lines with up and down
map <c-down> :t.<CR>
imap <c-down> <ESC>:t.<CR>i
map <c-up> :t.<CR><up>
imap <c-up> <ESC>:t.<CR><up>i

"move lines with up and down
map <s-down> :m+1<CR>
imap <s-down> <ESC>:m+1<CR>i

map <s-up> :m-2<CR>
imap <s-up> <ESC>:m-2<CR>i

" indent with arrowkeys
map <S-Right> >>^
imap <S-Right> <ESC>>>^i
vmap <S-Right> >><ESC>gv

map <S-Left> <<^
imap <S-Left> <ESC><<^i
vmap <S-Left> <<<ESC>gv

"==================================================================
"=============================NERDTree=============================
"==================================================================
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"==================================================================
"==========================CTAGS===================================
"==================================================================

"ctags file location
"set tags+=~/public_html/cdp-src/tags
function SetTags()
	let s:curdir = getcwd()

	while !filereadable("tags") && getcwd() != "/"
		cd ..
	endwhile

	if filereadable("tags")
		execute "set tags=" . getcwd() . "/tags"
	endif

	execute "cd " . fnameescape(s:curdir)
endfunction

call SetTags()

"ctags. jump to function
map tt <C-]>

"-------- taglist plugin-----------
map <c-f> :TlistToggle <CR>
imap <c-f> <ESC>:TlistToggle <CR>i



"==================================================================
"===========================TEXTBLOCKS=============================
"==================================================================
nnoremap <c-c> A // [] Tom Schoenlau (u_40) <ESC>"=strftime("%Y-%m-%d")<CR>pA: 
nnoremap <c-x> o // [] Tom Schoenlau (u_40) <ESC>"=strftime("%Y-%m-%d")<CR>pA: 

"==================================================================
"===========================PHP DOC================================
"==================================================================
"source ~/.vim/php-doc.vim
imap <C-o> :exe PhpDoc()<CR>i

"==================================================================
"===========================VIM Help===============================
"==================================================================
"map � <C-]>
"map � <C-O>
"==================================================================
"==========================QUICK PAIRS=============================
"==================================================================
let mapleader=","
imap <Leader>' ''<ESC>i
imap <Leader>" ""<ESC>i
imap <Leader>( ()<ESC>i
imap <Leader>{ {<ESC>o}<ESC><up>o
imap <Leader>[ []<ESC>i
