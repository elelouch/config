return {
  {
    "olimorris/onedarkpro.nvim",
    config=function()
      require("onedarkpro").setup({
        colors={
          fg="#fafafa"
        }
      })
    end
  }, 
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {},
    config = function()
      require('solarized').setup({
        style = {
          comments = {italic = false},
          functions = {italic = false},
          variables = {italic = false},
        }
      })
      vim.cmd.colorscheme 'solarized'
    end,
  }
}
