return {
  { "EdenEast/nightfox.nvim" },
  { 
    "rose-pine/neovim", name = "rose-pine",
    config = function() 
      local rosepine = require("rose-pine")
      rosepine.setup({
       styles = {
          bold = true,
          italic = false,
          transparency = false,
        },
        palette={
          main={
            base="#000000"
          },
        }
      })
    end
  }
}
