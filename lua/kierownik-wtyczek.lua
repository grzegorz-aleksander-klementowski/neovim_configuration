-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load Plugins
require("lazy").setup({
  -- Plugin Manager
  "folke/lazy.nvim",

  -- Core Plugins
  "nvim-treesitter/nvim-treesitter",
  "neovim/nvim-lspconfig",
  "nvim-telescope/telescope.nvim",
  "williamboman/mason.nvim",

  -- Useful Extras
  "nvim-tree/nvim-tree.lua",             -- File Explorer
  "nvim-lualine/lualine.nvim",           -- Status Line
  "windwp/nvim-autopairs",               -- Auto-close brackets
  "lewis6991/gitsigns.nvim",             -- Git integration
  "wakatime/vim-wakatime",               -- Tracking activity on nvim via waketime.com
  "lukas-reineke/indent-blankline.nvim", -- Indent Guides → pokazuje wcięcia za pomocą pionowych linii
  "j-hui/fidget.nvim",                   -- (Rust Analyzer) Status Window
  "phaazon/hop.nvim",                    -- Jump anyware in the bufferarea

  -- 🚀 **nvim-cmp: Autocompletion Setup**
  {
    "hrsh7th/nvim-cmp",           -- Core completion engine
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP completion
      "hrsh7th/cmp-buffer",       -- Completion from open buffers
      "hrsh7th/cmp-path",         -- File path completion
      "hrsh7th/cmp-cmdline",      -- Command-line completion
      "L3MON4D3/LuaSnip",         -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
      "onsails/lspkind.nvim",     -- Adds icons to completion menu
    },
    -- event = "InsertEnter", -- Load only when entering insert mode (faster startup)
    -- config = function()
    --   require("plugins.cmp")
    -- end,
  },

  -- ⚒️ utiliries: usefill smaller plugins
  "folke/which-key.nvim",  -- adds trot for keybindings
  "numToStr/Comment.nvim", -- an easy way to comments selected text in any programming language
  "nacro90/numb.nvim",     -- shows the line where want to jump in (ei. 123 line when type `:123`)
  "tpope/vim-fugitive",    -- GIt push, commit puls

  -- dependencies
  "nvim-treesitter/nvim-treesitter-textobjects", -- treesitter dependency to see objects and select them
  "tree-sitter/tree-sitter-rust",                -- tresitter dependency for rust
  "nvim-tree/nvim-web-devicons",                 -- dependency for which-key
  "JoosepAlviste/nvim-ts-context-commentstring", -- dependency for comments-nvim
})

--[[ *** Do sprawdzenia poten *** ]]
-- "nvimdev/lspsaga.nvim",             -- Sprawdzić to potem w wolnym czasie. better diagnostics, floating code actions, and an overall LSP experience
-- "Shatur/neovim-session-manager",   -- Używać od wersji 0.10 (now in Debian is 0.9.5). Saves a nvim sesion
-- "gorbit99/codewindow.nvim",              -- Minimapa - do sprawdzenia na potem
