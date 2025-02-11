-- REQUIRE VARIABLES --
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
require("mason-lspconfig").setup({
    ensure_installed = {}
})

local lsp = require('lsp-zero').preset({})
local cmp = require("cmp")
local lspconfig = require("lspconfig")

-- LSP CONFIGURATION
lsp.on_attach(function(client, bufnr)
   lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.clangd.setup{
  -- flags = {
  --   debounce_text_changes = 150,
  -- },
  -- init_options = {
  --   clangdFileStatus = true,
  --   clangdSemanticHighlighting = true,
  -- },
  -- filetypes = {'c', 'cpp', 'cxx', 'cc'},
  -- root_dir = function() vim.fn.getcwd() end,
  -- settings = {
  --   ['clangd'] = {
  --     ['compilationDatabasePath'] = 'build',
  --     ['fallbackFlags'] = {'-std=c++17'}
  --   }
  -- },
}

lsp.ensure_installed({
  'typescript-language-server',
  'prisma-language-server',
  'lua-language-server',
  'clangd',
  'cpptools',
  'pyright',
  'rust-analyzer',
  'html-lsp',
  'prettier',
})

lsp.setup()

-- CMP CONFIGURATION

cmp.setup({
  snippet = {
    expand = function(args)
       require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

--TERMINAL CONFIG

require("toggleterm").setup()
