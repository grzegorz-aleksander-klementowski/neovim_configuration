require("project_nvim").setup({
  manual_mode = false, -- Automatically change to the project root
  -- Optionally integrate with Telescope
  -- Manual mode doesn't automatically change your root directory, so you have
  -- the option to manually do so using `:ProjectRoot` command.

  -- Methods of detecting the root directory. **"lsp"** uses the native neovim
  -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
  -- order matters: if one is not detected, the other is used as fallback. You
  -- can also delete or rearangne the detection methods.
  detection_methods = { "lsp", "pattern" },

  -- All the patterns used to detect root dir, when **"pattern"** is in
  -- detection_methods
  patterns = { ".git", "_darcs", "Cargo.toml", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

  -- Table of lsp clients to ignore by name
  -- eg: { "efm", ... }
  ignore_lsp = {},

  -- Don't calculate root dir on specific directories
  -- Ex: { "~/.cargo/*", ... }
  exclude_dirs = {},

  -- Show hidden files in telescope
  show_hidden = false,

  -- When set to false, you will get a message when project.nvim changes your
  -- directory.
  silent_chdir = true,

  -- What scope to change the directory, valid options are
  -- * global (default)
  -- * tab
  -- * win
  scope_chdir = 'global',

  -- Path where project.nvim will store the project history for use in
  -- telescope
  datapath = vim.fn.stdpath("data"),
})

-- Integration with Telescop (make sure Telescope is loaded before this line)
require('telescope').load_extension('projects')
