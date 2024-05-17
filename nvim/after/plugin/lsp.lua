local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({buffer = bufnr})

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', '<leader>vca', function () vim.lsp.buf.code_action() end, opts)
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'tsserver', 'eslint', 'gopls'},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

lsp.setup()


-- Autocomplete
local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()
cmp.setup({
    sources = { 
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
    },
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({ select = false }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behaviour = 'select' }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behaviour = 'select' }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    formatting = lsp.cmp_format({ details = true }),
})
