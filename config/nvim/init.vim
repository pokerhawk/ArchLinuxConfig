"INITIAL CONFIG

set number
" :set relativenumber
" :colorscheme monokai " elflord, desert, delek and another one down there
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=5
:set mouse=a
:set modifiable

"SETTING MAPLEADER TO SPACEBAR:
let mapleader = ' '
let maplocalleader = ' '

"PLUGINS:

call plug#begin()

	Plug 'https://github.com/vim-airline/vim-airline.git' " that bar at the botton
	Plug 'https://github.com/preservim/nerdtree.git' " the TREE accessed with Control+t
	Plug 'https://github.com/tpope/vim-commentary.git' " quick keybind to comment -> gcc
	Plug 'https://github.com/preservim/tagbar.git' " to see all arguments and locate them // dep -> ctags (pacman -S ctags)
	Plug 'https://github.com/ryanoasis/vim-devicons' " icons for the TREE
	Plug 'https://github.com/tanvirtin/monokai.nvim.git' " monokai colorscheme theme
	Plug 'https://github.com/lukas-reineke/indent-blankline.nvim.git' " give lines that connect the brackets (easier to see)
	Plug 'https://github.com/junegunn/rainbow_parentheses.vim.git' " give brackets matching colors
	Plug 'https://github.com/sheerun/vim-polyglot.git' " syntax highlighting
	Plug 'https://github.com/jiangmiao/auto-pairs.git' " auto close brackets
	Plug 'https://github.com/mattn/emmet-vim.git' " HTML auto make
	Plug 'https://github.com/alvan/vim-closetag.git' " auto tag on HTML
	Plug 'https://github.com/airblade/vim-gitgutter.git' " Show git diff + and - on file
	Plug 'https://github.com/nvim-telescope/telescope.nvim.git' " Fuzzy finder (lupa)
	Plug 'https://github.com/ThePrimeagen/harpoon.git' " Mark files to quick access
	Plug 'https://github.com/folke/trouble.nvim.git' " Display error correction with control + space
	"Plug 'https://github.com/dense-analysis/ale' " syntax and semantic error correction
	" AUTO COMPLETION LSP:
	Plug 'https://github.com/williamboman/mason.nvim.git', { 'do': ':MasonUpdate' }
	Plug 'https://github.com/williamboman/mason-lspconfig.nvim'
	Plug 'https://github.com/neovim/nvim-lspconfig.git'
	Plug 'https://github.com/hrsh7th/nvim-cmp'
	Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'
	Plug 'https://github.com/L3MON4D3/LuaSnip'
	Plug 'https://github.com/VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
	Plug 'https://github.com/akinsho/toggleterm.nvim.git'

call plug#end()

" MAN MAP
"nmap = normal mode map
"imap = insert mode map
"vmap = select mode map
"nnoremap, inoremap, vnoremap ignore all mappings and does default map

" KEY BINDS:

"nmap j <Up>
"nmap k <Down>
noremap <C-j> 5j
noremap <C-k> 5k
noremap <C-h> 5h
noremap <C-l> 5l
"nmap <C-]> :horizontal stag <cword><CR>

" TELESCOPE
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

" MOVING LINES WITH ALTKEY:
nmap <A-Up> :m .-2<CR> 
nmap <A-Down> :m+<CR>
inoremap <A-Up> <ESC>:m .-2<CR>
inoremap <A-Down> <ESC>:m+<CR>

" NERD TREE KEYBINDS
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :TagbarToggle<CR>
"nnoremap <C-b> :NERDTree /home/pk/<CR>
"nnoremap <C-n> :NERDTree /run/media/HDD/Workspace<CR>
"nnoremap <C-h> :NERDTree /home/pk/.config/<CR>
nnoremap <silent><Leader><Leader> :e /home/pk/.config/nvim/init.vim<CR>
vnoremap <C-c> "+y
nnoremap <C-'> :ToggleTerm<CR>

" TAB AUTO COMPLETE
"inoremap <Tab> <C-n>
imap <S-Tab> <C-d>

" SHIFT + ARROW SELECT:

nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

" let g:user_emmet_leader_key=','
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" SYNTAX(COLOR) AND COLORSCHEME:

syntax on
colorscheme monokai
colorscheme monokai_pro
colorscheme monokai_soda
colorscheme monokai_ristretto
:colorscheme monokai 


" END
