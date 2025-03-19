-- Enable true colors support
vim.cmd('set termguicolors')

-- Set diagnostic highlight groups with visible background colors
vim.cmd('highlight DiagnosticError guibg=#FFCCCC guifg=#FF0000')
vim.cmd('highlight DiagnosticWarn  guibg=#FFEECC guifg=#FFA500')
vim.cmd('highlight DiagnosticInfo  guibg=#CCE5FF guifg=#0000FF')
vim.cmd('highlight DiagnosticHint  guibg=#CCFFCC guifg=#008000')

-- Configure diagnostics: virtual text with a custom prefix and underlines enabled
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    source = "if_many",
  },
  underline = true,
})

-- Ensure that files with a .rs extension are treated as Rust files
vim.cmd('autocmd BufRead,BufNewFile *.rs set filetype=rust')

-- Set up the Rust LSP (rust_analyzer)
local nvim_lsp = require('lspconfig')
nvim_lsp.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      -- You can add additional rust-analyzer settings here if needed
    }
  }
})
