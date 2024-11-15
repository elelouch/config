return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    config = function()
      local fzf = require("fzf-lua")
      fzf.setup({})
      vim.keymap.set('n', '<leader>ff', fzf.files, {})
      vim.keymap.set('n', '<leader>fg', fzf.grep, {})
      vim.keymap.set('n', '<leader>fb', fzf.buffers, {})
    end
  }
}
