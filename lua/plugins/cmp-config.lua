---@diagnostic disable: undefined-field, undefined-global, unused-local, redundant-parameter, param-type-mismatch

-- Load nvim-cmp (completion engine)
local cmp = require("cmp")

-- Load LuaSnip (snippets engine)
local luasnip = require("luasnip")

-- Load LSPkind (for better icons in completion menu)
local lspkind = require("lspkind")

cmp.setup({
  -- Configure key mappings
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),                                                     -- Manually trigger completion
    ["<Tab>"] = cmp.mapping.select_next_item(),                                                 -- Next suggestion
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),                                               -- Previous suggestion
    ["<CR>"] = cmp.mapping.confirm({ select = true }),                                          -- Confirm selection
    ["<C-e>"] = cmp.mapping.abort(),                                                            -- Cancel completion menu
    ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- Accept with replacement
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
    ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- Scroll documentation down
  }),

  -- Define completion sources
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- LSP-based suggestions
    { name = "buffer" },   -- Suggest words from current file
    { name = "path" },     -- File path completions
    { name = "luasnip" },  -- Snippet completions
    { name = "nvim_lua" }, -- Complete built-in Lua functions (useful for configuring NeoVim)
  }, {
    { name = "calc" },     -- Math calculations
    { name = "emoji" },    -- Emoji completions (for comments, if you care)
  }),

  -- Define snippet expansion
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Use LuaSnip
    end,
  },

  -- Window appearance (floating completion menu)
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- Formatting: icons, menu text
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",  -- Show icons and text
      maxwidth = 50,         -- Prevent UI overflow
      ellipsis_char = "...", -- Cut-off long items
    }),
  },

  -- Behavior: Completion settings
  experimental = {
    ghost_text = true, -- Show a preview of the completion suggestion inline
  },

  -- Sorting: Prioritize LSP over buffer suggestions
  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
})

-- **Setup Filetype-specific Completions**
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" }, -- Commit message autocompletions
    { name = "buffer" },
  }),
})

-- **Setup `/` and `:` Command-Line Completions**
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },    -- Path completion
  }, {
    { name = "cmdline" }, -- Command completions
  }),
})

-- **Load LSP-based completion for better performance**
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

-- Enable completion for key LSPs
local servers = { "rust_analyzer", "pyright", "ts_ls", "bashls", "sqlls", "html", "cssls" }
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
  })
end

-- **Setup Snippets**
require("luasnip.loaders.from_vscode").lazy_load()
