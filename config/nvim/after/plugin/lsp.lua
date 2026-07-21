-- ==========================
-- MASON
-- ==========================

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "ts_ls",
        "prismals",
        "clangd",
        "pyright",
        "rust_analyzer",
        "html",
    },
})

-- ==========================
-- LSP
-- ==========================

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, silent = true }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
            },
        },
    },
})

vim.lsp.config("clangd", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("pyright", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("html", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("prismals", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.enable({
    "lua_ls",
    "clangd",
    "pyright",
    "ts_ls",
    "rust_analyzer",
    "html",
    "prismals",
})

-- ==========================
-- DIAGNOSTICS
-- ==========================

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- ==========================
-- CMP
-- ==========================

local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
        }),
    }),

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
    }, {
        { name = "buffer" },
    }),
})

-- ==========================
-- TOGGLETERM
-- ==========================

require("toggleterm").setup()
