"""Plugin Manager"""
call plug#begin('~/.config/nvim/plugged')

Plug 'majutsushi/tagbar'
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rakr/vim-one'
Plug 'KeitaNakamura/neodark.vim'
Plug 'tomasiser/vim-code-dark'

" Initialize plugin system
call plug#end()

colorscheme codedark
set background=dark

set number
set mouse=a
set csre
set nocscopeverbose

"""Key Mappings"""
nmap <F8> :TagbarToggle<CR>

"""Cscope Setup"""
set tags=tags;/
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()
command LoadCscope call LoadCscope()
source ~/.vim/plugin/cscope_maps.vim
set nocscopeverbose

"""Ctrl-P configs"""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

