"                              ___           ___           ___     
"     ___        ___          /__/\         /  /\         /  /\    
"    /__/\      /  /\        |  |::\       /  /::\       /  /:/    
"    \  \:\    /  /:/        |  |:|:\     /  /:/\:\     /  /:/     
"     \  \:\  /__/::\      __|__|:|\:\   /  /:/~/:/    /  /:/  ___ 
" ___  \__\:\ \__\/\:\__  /__/::::| \:\ /__/:/ /:/___ /__/:/  /  /\
"/__/\ |  |:|    \  \:\/\ \  \:\~~\__\/ \  \:\/:::::/ \  \:\ /  /:/
"\  \:\|  |:|     \__\::/  \  \:\        \  \::/~~~~   \  \:\  /:/ 
" \  \:\__|:|     /__/:/    \  \:\        \  \:\        \  \:\/:/  
"  \__\::::/      \__\/      \  \:\        \  \:\        \  \::/   
"      ~~~~                   \__\/         \__\/         \__\/    
"                                                        
"maintainer:	Lucca Augusto

"============================
"Basic Settings
"============================
	execute pathogen#infect()
	execute pathogen#helptags()
	filetype plugin indent on
	syntax on
	set smartindent
	set breakindent

	colorscheme wal
	
	"Split pannels in a more natural way
	set splitbelow
	set splitright
	
	"Configure tab size
	set tabstop=4
	set shiftwidth=4
	"set expandtab
	
	"Get trailing characters on tab to view indents more easily
	"set list
	"set listchars=tab:\.\ 
	
	"Some more personal settings
	set number
	set relativenumber    "sets the line numbers relative to the current line
	set nocompatible
	set autoindent        "auto indentation when enter is pressed
	set showmode          "shows vim current mode
	set wildmenu          "auto completion when ctrl+n is pressed
	set incsearch         "searches as you type each letter
	"set lazyredraw        "only redraws the screen when really needed
	set foldenable        "allows code folding when zf is pressed. zd to unfold
	"set noundofile       "do not save an undo file
	set undofile
	set undodir=/tmp      "Save undo files in tmp directory
	"set nobackup         "do not save a backup file
	set backup
	set backupdir=/tmp    "Save backup files in tmp directory
	"set hlsearch
	set wildmode=longest,list,full
	set ignorecase "search is case insensitive
	set smartcase "case sensitive search in case the is an uppercase character in search
	
	"Remap j and k so i can navigate on lines that break
	nnoremap j gj
	nnoremap k gk
	vnoremap j gj
	vnoremap k gk


"===============================
"Mappings to make things quicker
"===============================
	map <C-s> :w<CR>
	nmap <C-s> :w<CR>
	nmap <leader>w :wq<CR>
	nnoremap <leader>c :close<CR>
	nnoremap <leader>o :q<CR>
	nnoremap <leader>O :q!<CR>
	nnoremap <leader>v :vsplit 
	nnoremap <leader>s :split 
	"Move faster between tabs
	nnoremap <leader>j :tabNext<CR>
	nnoremap <leader>f :filetype detect<CR>
	
	"Allow to copy and paste from the system register
	vnoremap <C-y> "*y :let @+=@*<CR>
	nnoremap <C-p> "+P
	
	"Save a key press on changing windows
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

"update bindings when sxhkd config is updated
	autocmd BufWritePost sxhkdrc killall sxhkd; setsid sxhkd &
"recompile suckless programs after editing
	autocmd BufWritePost dwm.c !sudo make clean; sudo make install
	autocmd BufWritePost config.def.h !sudo make clean; sudo make install
	autocmd BufWritePost st.c !sudo make clean; sudo make install

"===============================
"SNIPPETS
"===============================

	"insert tags like this <++> for faster navigation
	"when inserting brackets, etc.
	"Snippets
	nnoremap <leader><space> :nohlsearch<CR>
	inoremap <Space><Space> <Esc>/<++><CR>"_c4l
	inoremap { {<++>}<++><Esc>3h?<++><CR>4xi
	inoremap {<CR> {<CR><++><CR>}<++><Esc>4h?<++><CR>4xa
	inoremap ( (<++>)<++><Esc>3h?<++><CR>4xi
	inoremap () ()
	inoremap [ [<++>]<++><Esc>3h?<++><CR>4xi
	"inoremap " "<++>"<++><Esc>3h?<++><CR>4xi
	"inoremap ' '<++>'<++><Esc>3h?<++><CR>4xi
	
	"Some compile commands for these file types
	au FileType tex map <buffer> <F10> :w<CR>:!pdflatex<Space>%<CR>
	au FileType java map <buffer> <F10> :w<CR>:!javac<Space>%<CR>
	au FileType java map <buffer> <F7> :!java<Space>'%:t:r'<CR>
	au FileType c map <buffer> <F10> :w<CR>:!gcc<Space>-o<Space>expand('%:t:r').out<Space>expand('%:t')<CR>
	au FileType sh inoremap [ [ <++> ]<++><Esc>3h?<++><CR>4xi

	"Some scripts to make things quicker when creating specific files
	au FileType c map <buffer> <F9> :Bc<CR>
	au FileType java map <buffer> <F9> :Bj<CR>

	command! Bc call BeginC()
	function! BeginC()
		normal! i#include <stdlib.h>
		normal! o#include <stdio.h>
		normal! o
		normal! oint main()
		normal! o{
		normal! o
		normal! oreturn 0;
		normal! o}
		normal! 2k
	endfunction

	command! Bj call BeginJ()
	function! BeginJ()
		normal! ipublic class <++>{
		normal! opublic static void main(String[] args){<CR>
		normal! o
		normal! o}
		normal! o}
	endfunction


