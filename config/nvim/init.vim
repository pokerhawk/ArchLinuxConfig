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

	Plug 'https://github.com/vim-airline/vim-airline.git' " that bar at the botton
	Plug 'https://github.com/preservim/nerdtree.git' " the TREE accessed with Control+t
	Plug 'https://github.com/tc50cal/vim-terminal.git' " terminal on nvim
	Plug 'https://github.com/tpope/vim-commentary.git' " quick keybind to comment -> gcc
	Plug 'https://github.com/preservim/tagbar.git' " to see all arguments and locate them // dep -> ctags (pacman -S ctags)
	Plug 'https://github.com/ryanoasis/vim-devicons' " icons for the TREE
	Plug 'https://github.com/tanvirtin/monokai.nvim.git' " monokai colorscheme theme
	Plug 'https://github.com/neoclide/coc.nvim.git' " auto completion for languages -> nodejs
	Plug 'https://github.com/lukas-reineke/indent-blankline.nvim.git' " give lines that connect the brackets (easier to see)
	" Plug 'https://github.com/junegunn/rainbow_parentheses.vim.git' " give brackets matching colors
	Plug 'https://github.com/sheerun/vim-polyglot.git' " syntax highlighting
	Plug 'https://github.com/jiangmiao/auto-pairs.git' " auto close brackets
	Plug 'https://github.com/mattn/emmet-vim' " HTML auto make
	Plug 'https://github.com/alvan/vim-closetag' " auto tag on HTML

call plug#end()

noremap <C-Up> 5k
noremap <C-Down> 5j
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-c> :TagbarToggle<CR>
nnoremap <C-b> :NERDTree /home/pk/<CR>
nnoremap <C-n> :NERDTree /run/media/HDD/Workspace<CR>
nnoremap <C-h> :NERDTree /home/pk/.config/<CR>
nnoremap <silent> <Leader><Leader> :source /home/pk/.config/nvim/init.vim<CR>
" nnoremap <C-'> :Terminal Toggle<CR>

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" let g:user_emmet_leader_key=','
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
