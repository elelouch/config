return {
  { 
    "EdenEast/nightfox.nvim", 
    config=function()
      require("nightfox").setup({
        palettes = {
          carbonfox = {
            bg1 = "#000000", -- Black background
          },
        },
      })
      vim.cmd 'colorscheme carbonfox'
    end
  }
}
