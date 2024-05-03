local bi = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', bi.find_files, {})
vim.keymap.set('n', '<leader>ps', function () bi.grep_string({ search = vim.fn.input('Grep > ') }) end)
vim.keymap.set('n', '<C-p>', bi.git_files, {})
