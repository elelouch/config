return {
  { 
    "rose-pine/neovim", as = "rose-pine",
    config = function() 
      require("rose-pine").setup({
        styles={
          bold=true,
          italic=false,
          transparency=false
        }
      })
    end
  },
  { "EdenEast/nightfox.nvim" },
  {"rebelot/kanagawa.nvim"}
}
