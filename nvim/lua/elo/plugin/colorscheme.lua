return {
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config=function()
      require("catppuccin").setup {
      color_overrides = {
          mocha = {
            base = "#0f0f0f",
            mantle = "#0f0f0f",
            crust = "#101010",
            text = "#ffffff"
          },
        }
      }
    end
  }
}
