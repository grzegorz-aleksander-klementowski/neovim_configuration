vim.opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }
vim.opt.showcmd = true                                                 -- Show command in bottom bar
vim.opt.laststatus = 3                                                 -- Always show statusline (modern UI)

vim.opt.termguicolors = true                                           -- Ensure true color
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "#ffffff" }) -- Keep transparent but set white text
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff", bg = "none" }) -- Make border white

vim.cmd([[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NonText guibg=NONE ctermbg=NONE
      highlight LineNr guibg=NONE ctermbg=NONE
      highlight Folded guibg=NONE ctermbg=NONE
      highlight EndOfBuffer guibg=NONE ctermbg=NONE
      highlight SignColumn guibg=NONE ctermbg=NONE
]])

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd([[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NonText guibg=NONE ctermbg=NONE
      highlight LineNr guibg=NONE ctermbg=NONE
      highlight Folded guibg=NONE ctermbg=NONE
      highlight EndOfBuffer guibg=NONE ctermbg=NONE
      highlight SignColumn guibg=NONE ctermbg=NONE
    ]])
  end,
})

-- vim.cmd("colorscheme default") -- can be changed to ei. „blue”
