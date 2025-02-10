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
:set foldmethod=indent
" za fold and unfold

" :set foldmethod=syntax

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

	" Color Schemes
	Plug 'https://github.com/tanvirtin/monokai.nvim.git' " monokai colorscheme theme
	Plug 'https://github.com/polirritmico/monokai-nightasty.nvim.git' " monokai-nightasty colorscheme

	Plug 'https://github.com/lukas-reineke/indent-blankline.nvim.git' " give lines that connect the brackets (easier to see)
	Plug 'https://github.com/junegunn/rainbow_parentheses.vim.git' " give brackets matching colors
	Plug 'https://github.com/sheerun/vim-polyglot.git' " syntax highlighting
	Plug 'https://github.com/jiangmiao/auto-pairs.git' " auto close brackets
	Plug 'https://github.com/mattn/emmet-vim.git' " HTML auto make
	Plug 'https://github.com/alvan/vim-closetag.git' " auto tag on HTML
	Plug 'https://github.com/airblade/vim-gitgutter.git' " Show git diff + and - on file
	Plug 'https://github.com/nvim-telescope/telescope.nvim.git' " Fuzzy finder (lupa) dep -> plenary.nvim and pacman -S ripgrep
	Plug 'https://github.com/nvim-lua/plenary.nvim.git' " Dep of telescope
	Plug 'https://github.com/ThePrimeagen/harpoon.git' " Mark files to quick access
	Plug 'https://github.com/folke/trouble.nvim.git' " Display error correction with control + space
	Plug 'https://github.com/junegunn/fzf.vim.git' "Display error correction
	Plug 'https://github.com/nvim-tree/nvim-web-devicons.git' "dep for something
	"Plug 'https://github.com/dense-analysis/ale' " syntax and semantic error correction
	Plug 'https://github.com/lukas-reineke/indent-blankline.nvim.git' " add indent line
	Plug 'https://github.com/styled-components/vim-styled-components', { 'branch': 'main' } " syntax and auto completion for styled components
	Plug 'https://github.com/mrcjkb/rustaceanvim' " Rust LSP (requires rust-analyzer on Mason)
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

noremap <C-j> 5j
noremap <C-k> 5k
noremap <C-h> 5h
noremap <C-l> 5l
nnoremap <C-.> :lua vim.diagnostic.open_float()<CR>

"Reload this file
nnoremap <leader><leader>r :source $MYVIMRC<CR>

" Command to replace a instance word then find other instances with dot (.)
nnoremap <silent> <C-Tab> :let @/=expand('<cword>')<cr>cgn
" nnoremap <C-]><cmd>:horizontal stag <cword><CR>

" Substitui todas as palavras iguais:
nnoremap <silent> <leader> <C-l> :%s/\<<c-r><c-w>\>//g<Left><Left>

" TELESCOPE
nnoremap <leader>tp <cmd>Telescope find_files<CR>
nnoremap <leader><leader>tp <cmd>lua require("telescope.builtin").find_files({hidden = true})<CR>
nnoremap <leader>tt <cmd>Telescope live_grep<CR>
nnoremap <leader>tb <cmd>Telescope buffers<CR>
nnoremap <leader>th <cmd>Telescope help_tags<CR>
nnoremap <expr> <leader>fd ':Telescope find_files<cr>' . expand('<cword>')

nnoremap <expr> <leader>ff ':Telescope live_grep<cr>' . expand('<cword>')

" HARPOON

nnoremap <leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hh :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>hi :lua require("harpoon.ui").nav_next()<CR>
nnoremap <leader>ho :lua require("harpoon.ui").nav_prev()<CR>
"nnoremap <leader>hh :lua require("harpoon.term").gotoTerminal(1)<CR>
"nnoremap <leader>hb :lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>
"nnoremap <leader>hg :lua require("harpoon.term").sendCommand(1, 1)<CR>

" TROUBLE TOGGLE
nnoremap <leader>xx <cmd>Trouble diagnostics toggle<cr>
" nnoremap <leader>xw <cmd>Trouble workspace_diagnostics toggle<cr>
" nnoremap <leader>xd <cmd>Trouble document_diagnostics<cr>
nnoremap <leader>xq <cmd>Trouble quickfix toggle<cr>
nnoremap <leader>xl <cmd>Trouble loclist toggle<cr>
nnoremap gR <cmd>Trouble lsp_references<cr>

" Move line(s) up
nnoremap <A-k> :m-2<CR>==
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <A-Up> :m-2<CR>==
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Move line(s) down
nnoremap <A-j> :m+<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
nnoremap <A-Down> :m+<CR>==
vnoremap <A-Down> :m '>+1<CR>gv=gv

" NERD TREE KEYBINDS
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :TagbarToggle<CR>
"nnoremap <C-b> :NERDTree /home/pk/<CR>
"nnoremap <C-n> :NERDTree /run/media/HDD/Workspace<CR>
"nnoremap <C-h> :NERDTree /home/pk/.config/<CR>
nnoremap <silent><Leader><Leader><Leader> :e /home/pk/.config/nvim/init.vim<CR>
vnoremap <C-c> "+y
vnoremap <C-S-v> "+p
nnoremap <C-'> :ToggleTerm<CR>

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
" hjkl
nmap <S-k> v<Up>
nmap <S-j> v<Down>
nmap <S-h> v<Left>
nmap <S-l> v<Right>
vmap <S-k> <Up>
vmap <S-j> <Down>
vmap <S-h> <Left>
vmap <S-l> <Right>

nmap <silent><Leader>s :vsp<CR><C-]>

" let g:user_emmet_leader_key=','
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" SYNTAX(COLOR) AND COLORSCHEME:

syntax on
" colorscheme monokai
" colorscheme monokai_pro
" colorscheme monokai_soda
" colorscheme monokai_ristretto
:colorscheme monokai-nightasty
:lua require("ibl").setup()
:lua require("trouble").setup()

" END
