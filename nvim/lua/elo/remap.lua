local km = vim.keymap
-- debug
local builtin = require('telescope.builtin')
km.set('n', '<leader>ff', builtin.find_files, {})
km.set('n', '<leader>fg', builtin.live_grep, {})
km.set('n', '<leader>fb', builtin.buffers, {})
km.set('n', '<leader>fh', builtin.help_tags, {})
km.set("n", "<leader>1", "<cmd>Le<CR>")
km.set("n", "<leader>bf", "<cmd>Format<CR>")
km.set("n", "<leader>nt", "<cmd>Neotree<CR>")
-- reset cfg
km.set("n", "<leader>xx", "<cmd>luafile $MYVIMRC<CR>")
