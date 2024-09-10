return {
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config=function()
      require("catppuccin").setup {
      color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
            text = "#ffffff"
          },
        }
      }
      vim.cmd 'colorscheme catppuccin-mocha'
    end
  }
}
