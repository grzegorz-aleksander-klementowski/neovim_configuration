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
  "nvim-lua/plenary.nvim",
  "mfussenegger/nvim-dap",
  "simrat39/rust-tools.nvim",


  -- Useful Extras
  "nvim-tree/nvim-tree.lua",             -- File Explorer
  "nvim-lualine/lualine.nvim",           -- Status Line
  "windwp/nvim-autopairs",               -- Auto-close brackets
  "lewis6991/gitsigns.nvim",             -- Git integration. Add signs (like vertical lines next to code line) to show git changes
  "wakatime/vim-wakatime",               -- Tracking activity on nvim via waketime.com
  "lukas-reineke/indent-blankline.nvim", -- Indent Guides
  "j-hui/fidget.nvim",                   -- (Rust Analyzer) Status Window
  "ahmedkhalf/project.nvim",             -- Discovers projects automatically
  "sindrets/diffview.nvim",              -- Shows the differences between git versions
  "mg979/vim-visual-multi",              -- Wielowskaźnik wieloliniowy (multicursor multilines)
  {                                      -- Inline support for Rust Crates.toml
    'saecki/crates.nvim',
    tag = 'stable',
  },
  { -- Support for hex colors in NeoVim
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
    },
  },
  -- { -- Pokazuje określenie zmiennych (signatures) w pł. oknach
  --   "ray-x/lsp_signature.nvim",
  --   event = "InsertEnter",
  --   opts = {
  --     -- cfg options
  --   },
  -- },

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
    -- event = "InsertEnter", -- Uncomment to load on insert mode (faster startup)
    -- config = function()
    --   require("plugins.cmp")
    -- end,
  },

  -- Plugins with instended installation settings
  require("plugins.hop"),     -- Hop to any word and line by a simple way
  require("plugins.lspsaga"), -- Better LSP UI
  require("ui.dressing"),     -- Additional UI for the floating windows
  require("ui.noice"),        -- Better notifications UI
  require("plugins/lsp_signature"), -- show floating windows of variables

  -- ⚒️ Utilities and other plugins
  "folke/which-key.nvim",           -- Adds help for keybindings
  "numToStr/Comment.nvim",          -- Easy commenting in any programming language
  "nacro90/numb.nvim",              -- Shows the target line when jumping
  "tpope/vim-fugitive",             -- Git commands integration
  "wfxr/minimap.vim",               -- Code minimap
  "mbbill/undotree",                -- Visualize tree of undo history
  "lukas-reineke/virt-column.nvim", -- Add the line on the right that indicate the max chracter in line

  -- Dependencies for various plugins
  "nvim-treesitter/nvim-treesitter-textobjects", -- Treesitter: see objects and select them
  "tree-sitter/tree-sitter-rust",                -- Treesitter dependency for Rust
  "nvim-tree/nvim-web-devicons",                 -- Icons for file types, etc.
  "JoosepAlviste/nvim-ts-context-commentstring", -- Context-aware commenting
})

--[[ *** Do sprawdzenia potem *** ]]
-- require("plugins.rustaceanvim"),   -- Better Rust experience (avaible from NeoVim versoin 0.11 (then install adaszko/tree_climber_rust.nvim))
-- "nvimdev/lspsaga.nvim",            -- For enhanced diagnostics and code actions
-- "Shatur/neovim-session-manager",   -- Session management for nvim (consider for version >= 0.10)
-- "yamatsum/nvim-cursorline",        -- Colored and better UI the cursor line
