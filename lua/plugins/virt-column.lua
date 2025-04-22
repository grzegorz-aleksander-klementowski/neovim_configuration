-- lua/plugins/virt-column.lua
return {
  "lukas-reineke/virt-column.nvim",
  event = "BufWinEnter", -- load when a buffer window opens
  opts = {
    virtcolumn = "80", -- which column(s) to draw
    char       = "│", -- the character to use
    highlight  = "Comment", -- or "ColorColumn", whatever you like
  },
}
