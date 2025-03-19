-- LSP Server Setup
local lspconfig = require("lspconfig")

local servers = {
  rust_analyzer = { filetypes = { "rust" } },
  pyright       = { filetypes = { "python" } },
  ts_ls         = { filetypes = { "javascript", "typescript" } },
  sqlls         = { filetypes = { "sql" } },
  bashls        = { filetypes = { "sh", "bash", "zsh" } },
  clangd        = { filetypes = { "c", "cpp" } },
  html          = { filetypes = { "html" } },
  cssls         = { filetypes = { "css", "scss", "less" } },
  jsonls        = { filetypes = { "json" } },
  yamlls        = { filetypes = { "yaml" } },
  lua_ls        = {
    filetypes = { "lua" },
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT", -- Use LuaJIT for Neovim
        },
        diagnostics = {
          globals = { "vim" }, -- Recognize the `vim` global
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
for server, config in pairs(servers) do
  config.capabilities = capabilities
  lspconfig[server].setup(config)
end

-- Configure Diagnostic Signs (Gutter)
local signs = { Error = "🔥", Warn = "⚠️", Hint = "💡", Info = "ℹ️" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Configure Diagnostic Settings
vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- Small bullet as prefix for inline errors
    spacing = 4,
  },
  signs = true,
  underline = false,
  update_in_insert = false, -- Do not update diagnostics while typing
  severity_sort = true,
  float = {
    focusable = false,
    border = "rounded",
    source = "always",
    header = "🏮️ LSP WARNING 🏮️", -- Custom title for float window
    prefix = "⚠️ ",
  },
})

-- Enable Signature Help (Function Parameter Hints) on CursorHoldI
vim.api.nvim_create_autocmd("CursorHoldI", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.signature_help()
  end,
})

-- ============================================================================
-- Diagnostic Background Highlighting
-- ============================================================================
-- Define a namespace for our custom diagnostic background highlights
local diag_ns = vim.api.nvim_create_namespace("diagnostic_bg")

-- Function to set our custom highlight groups for diagnostic backgrounds.
-- We use these groups in our highlight_diagnostics() function.
local function set_diagnostic_highlights()
  vim.api.nvim_set_hl(0, "DiagnosticBackgroundError", { bg = "#51202A", fg = "#FF0000", bold = true })
  vim.api.nvim_set_hl(0, "DiagnosticBackgroundWarn", { bg = "#52462A", fg = "#FFCC00", bold = true })
  vim.api.nvim_set_hl(0, "DiagnosticBackgroundInfo", { bg = "#2A5246", fg = "#00FFFF", bold = true })
  vim.api.nvim_set_hl(0, "DiagnosticBackgroundHint", { bg = "#2A4652", fg = "#00FF00", bold = true })
end

-- Set them initially…
set_diagnostic_highlights()
-- …and reapply them whenever the colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_diagnostic_highlights,
})

-- Map diagnostic severities to our custom highlight groups
local severity_to_hl = {
  [vim.diagnostic.severity.ERROR] = "DiagnosticBackgroundError",
  [vim.diagnostic.severity.WARN]  = "DiagnosticBackgroundWarn",
  [vim.diagnostic.severity.INFO]  = "DiagnosticBackgroundInfo",
  [vim.diagnostic.severity.HINT]  = "DiagnosticBackgroundHint",
}

-- Function that adds background highlights to the problematic text ranges
local function highlight_diagnostics()
  local bufnr = vim.api.nvim_get_current_buf()
  -- Clear previous highlights in our namespace
  vim.api.nvim_buf_clear_namespace(bufnr, diag_ns, 0, -1)
  -- Get all diagnostics for the current buffer
  local diagnostics = vim.diagnostic.get(bufnr)
  for _, diag in ipairs(diagnostics) do
    local hl = severity_to_hl[diag.severity]
    local start_col = diag.col or 0
    local end_col = diag.end_col or (start_col + 1)
    vim.api.nvim_buf_add_highlight(bufnr, diag_ns, hl, diag.lnum, start_col, end_col)
  end
end

-- Update highlights on various events
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "CursorHold", "InsertLeave", "TextChanged" }, {
  callback = highlight_diagnostics,
})

-- ============================================================================
-- Floating Window for Diagnostics (when hovering on the problematic text)
-- ============================================================================
vim.o.updatetime = 300
vim.cmd [[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, {scope = "cursor"})
  autocmd BufReadPost,InsertLeave * lua vim.diagnostic.setloclist({open = false})
]]

-- Autoformat on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Keymaps for LSP functions
vim.keymap.set("n", "gd", ":vsplit | lua vim.lsp.buf.definition()<CR>", { silent = true })
vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", { silent = true })
