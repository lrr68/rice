set smartindent
set breakindent
set encoding=utf-8
"no ugly | cursor, only block cursor
set guicursor=
set noerrorbells
set signcolumn=yes
set scrolloff=8
set hidden
set nowrap
set updatetime=300

set clipboard=unnamed,unnamedplus

"Split panels in a more natural way
set splitbelow
set splitright

"Configure tab size
set tabstop=4
set shiftwidth=4
"set expandtab "indent with spaces
set noexpandtab "do not indent with spaces

"Get trailing characters on tab to view indents more easily
"set list
"set listchars=tab:\.\

set number
set relativenumber    "sets the line numbers relative to the current line
set nocompatible	  "no behaving like vi
set autoindent        "auto indentation when enter is pressed
set showmode          "shows vim current mode
"set wildmenu          "auto completion when ctrl+n is pressed
"set wildmode=longest,list,full
set incsearch         "searches as you type each letter
"set lazyredraw        "only redraws the screen when really needed
set foldenable        "allows code folding when zf is pressed. zd to unfold
"set noundofile       "do not save an undo file
set undofile
set undodir=/tmp      "Save undo files in tmp directory
"set nobackup         "do not save a backup file
set backup
set backupdir=/tmp    "Save backup files in tmp directory
set hlsearch
set ignorecase "search is case insensitive
set smartcase "case sensitive search in case the is an uppercase character in search
set background=dark

"set termguicolors

"set cursorline
"set cursorcolumn
highlight CursorLine cterm=underline gui=underline ctermbg=none ctermfg=none

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
	" select the highlighting
	if i + 1 == tabpagenr()
	  let s ..= '%#TabLineSel#'
	else
	  let s ..= '%#TabLine#'
	endif

	" set the tab page number (for mouse clicks)
	let s ..= '%' .. (i + 1) .. 'T'

	" the label is made by MyTabLabel()
	let s ..= ' %{MyTabLabel(' .. (i + 1) .. ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s ..= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
	let s ..= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

":set tabline=%!MyTabLine()

" CMP settings
set completeopt=menu,menuone,noselect

" Vimwiki settings
let g:vimwiki_list = [{'path': '~/Documents/personal-notes/'}]

let g:copilot_filetypes = { 'xml':  v:false, 'wiki': v:false, 'md':   v:false }

autocmd BufReadPost *.rasi ColorizerAttachToBuffer

" Open md files in Goyo
" au BufReadPost *.md Goyo | set wrap
