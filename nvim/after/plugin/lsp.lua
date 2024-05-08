local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'tsserver', 'eslint'},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

lsp.setup()


-- Autocomplete
local cmp = require('cmp')
local select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    sources = { {name = 'nvim_lsp'} },
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({select = false}),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-j>'] = cmp.mapping.select_prev_item(select),
        ['<C-k>'] = cmp.mapping.select_next_item(select),
        ['<C-p>'] = cmp.select_prev_item(select),
        ['<C-n>'] = cmp.select_next_item(select),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
})
