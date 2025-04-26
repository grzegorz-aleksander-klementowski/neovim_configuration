-- lua/plugins/rustaceanvim.lua
return {
  'mrcjkb/rustaceanvim',
  version      = '^6',         -- pin to latest v6.x
  lazy         = false,        -- load immediately
  dependencies = {
    'mfussenegger/nvim-dap',   -- for debugging support
    'williamboman/mason.nvim', -- optional: for managing rust-analyzer, codelldb, etc.
  },

  -- Plugin reads config from this global before it initializes
  init         = function()
    vim.g.rustaceanvim = {
      dap = { adapter = 'codelldb' }, -- if you have codelldb in your PATH or installed via mason
      -- you can add other rust-analyzer settings here,
      -- e.g. checkOnSave = { command = "clippy" },
    }
  end,

  -- Set up your Rust-specific keymaps on FileType = rust
  config       = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'rust',
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local map = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr })
        end

        map('n', '<leader>ca', function() vim.cmd.RustLsp('codeAction') end)
        map('n', 'K', function() vim.cmd.RustLsp({ 'hover', 'actions' }) end)
        map('n', '<leader>rr', function() vim.cmd.RustLsp('run') end)
        map('n', '<leader>rt', function() vim.cmd.RustLsp('testables') end)
        map('n', '<leader>rd', function() vim.cmd.RustLsp('debug') end)
        map('n', '<leader>rl', function() vim.cmd.RustLsp('runnables') end)
      end,
    })
  end,
}
