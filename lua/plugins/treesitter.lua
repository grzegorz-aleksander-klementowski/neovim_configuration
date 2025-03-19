-- Konfiguracja wygenerowana przez RozmównikGPT (Poprawiona)
require("nvim-treesitter.configs").setup({
  -- 🌟 Install these languages automatically
  ensure_installed = {
    "lua", "rust", "python", "sql", "javascript", "json", "html", "css",
    "bash", "yaml", "toml", "markdown", "markdown_inline",
    "c", "cpp", "make", "cmake", "vim", "vimdoc", "query"
  },

  -- Required fields added with default values:
  sync_install = false, -- install languages synchronously (set to false by default)
  auto_install = false, -- do not automatically install missing parsers
  ignore_install = {},  -- list of parsers to ignore installing
  modules = {},         -- empty table for modules if not used

  -- ✅ Enable syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true, -- Keep this false for speed if desired
  },

  -- ✅ Enable Treesitter-based indentation
  indent = { enable = true },

  -- ✅ Enable better code folding
  fold = { enable = true },

  -- ✅ Enable Treesitter-powered text objects
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- Functions
        ["af"] = "@function.outer", -- Select whole function (including `fn name() {}`)
        ["if"] = "@function.inner", -- Select inside function (only the body)

        -- Conditionals (for `match`, `if`, `else`)
        ["ai"] = "@conditional.outer", -- Select whole conditional (`if`, `match`, etc.)
        ["ii"] = "@conditional.inner", -- Select inside condition (just branches)

        -- Loops
        ["al"] = "@loop.outer", -- Select whole loop (`for`, `while`, `loop`)
        ["il"] = "@loop.inner", -- Select inside loop

        -- Blocks & Expressions
        ["ab"] = "@block.outer", -- Select entire `{}` block
        ["ib"] = "@block.inner", -- Select inside `{}` block
      },
    },
  },

  -- ✅ Enable incremental selection (refining selections in steps)
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>tt",   -- Start selection
      node_incremental = "<leader>tg", -- Expand selection
      node_decremental = "<leader>th", -- Shrink selection
    },
  },

  -- ✅ Enable Treesitter-based refactoring (renaming, navigation, etc.)
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = { smart_rename = "<leader>tf" },
    },
  },
})
