return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    config = function()
      local fzf = require("fzf-lua")
      fzf.setup({'fzf-native'})
      vim.keymap.set('n', '<leader>ff', fzf.files, {})
      vim.keymap.set('n', '<leader>fg', fzf.grep, {})
      vim.keymap.set('n', '<leader>fj', fzf.git_files, {})
      vim.keymap.set('n', '<leader>fb', fzf.buffers, {})
    end
  }
}
