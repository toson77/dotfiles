set number
set termguicolors
set tabstop=4
set shiftwidth=4
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,enc-jp,sjis

"nasm syntax enable .nas
augroup nasm_syntax
autocmd!
autocmd BufNewFile,BufRead *.nas setfiletype nasm
augroup end

call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shirk/vim-gas'
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'cohama/lexima.vim'
call plug#end()

" jj same to Esc
inoremap <silent> jk <ESC>
" coc.nvim enable <TAB> <S-TAB> <CR>
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" coc.nvim GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" coc.nvim hover menu
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<Left>"

" lexima enable auto close parentheses
let g:lexima_enable_basic_rules = 1

" NERDTree quit on open
let g:NERDTreeQuitOnOpen = 1

" auto rustfmt when save
let g:rustfmt_autosave = 1

" joshdick/onedark.vim
colorscheme onedark
"airblade/vim-gitgutter
set updatetime=100

" itchyny/lightline.vim
let g:lightline = {'colorscheme' : 'onedark'}

" ALE fixer
let g:ale_fixers = {
	\ 'c':['astyle'],
	\}


" scrooloose/nerdtree
nmap <C-e> :NERDTreeToggle<CR>

" majutsushi/tagbar
nmap <F8> :TagbarToggle<CR>

" fzf settings
let $FZF_DEFAULT_OPTS='--layout=reverse'
let $FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/**"'
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

let mapleader = "\<Space>"

" fzf
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>

" cooperation between tmux and nvim
" background color when not in focus
let g:InactiveBackGround = 'guibg=#3f4551'

" pain color when not in focus
execute ('hi NormalNC '.g:InactiveBackGround)
execute ('hi NontextNC '.g:InactiveBackGround)
execute ('hi SpecialkeyNC '.g:InactiveBackGround)
execute ('hi EndOfBufferNC '.g:InactiveBackGround)

" focus switching setting
augroup ChangeBackGround
	autocmd!
	" when focus
	autocmd FocusGained * hi Normal guibg='#282c34'
	autocmd FocusGained * hi NonText guibg='#282c34'
	autocmd FocusGained * hi SpecialKey guibg='#282c34'
	" SpecialKey
	autocmd FocusGained * hi EndOfBuffer ctermbg=none
	" when not focus
	autocmd FocusLost * execute('hi Normal '.g:InactiveBackGround)
	autocmd FocusLost * execute('hi NonText '.g:InactiveBackGround)
	autocmd FocusLost * execute('hi SpecialKey '.g:InactiveBackGround)
	autocmd FocusLost * execute('hi EndOfBuffer '.g:InactiveBackGround)
augroup end
