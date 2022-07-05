set number
" :set relativenumber
" :colorscheme monokai " elflord, desert, delek and another one down there
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=5
:set mouse=a

call plug#begin()

	Plug 'https://github.com/vim-airline/vim-airline.git'
	Plug 'https://github.com/preservim/nerdtree.git'
	Plug 'https://github.com/tc50cal/vim-terminal.git'
	Plug 'https://github.com/tpope/vim-commentary.git'
	Plug 'https://github.com/preservim/tagbar.git' "dep -> ctags (pacman -S ctags)
	Plug 'https://github.com/ryanoasis/vim-devicons'
	" Plug 'https://github.com/ryanoasis/nerd-fonts.git' ttf-nerd-fonts-symbols
	Plug 'https://github.com/tanvirtin/monokai.nvim.git'
	Plug 'https://github.com/neoclide/coc.nvim.git'
	Plug 'https://github.com/lukas-reineke/indent-blankline.nvim.git'

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-c> :TagbarToggle<CR>
nnoremap <C-b> :NERDTree /home/pk/<CR>
nnoremap <C-n> :NERDTree /run/media/HDD/Workspace<CR>
nnoremap <C-h> :NERDTree /home/pk/.config/<CR>
" nnoremap <C-'> :Terminal Toggle<CR>

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \  'coc-eslint',
  \  'coc-prettier'
  \ ]

syntax on
colorscheme monokai
colorscheme monokai_pro
colorscheme monokai_soda
colorscheme monokai_ristretto
:colorscheme monokai 


" END
