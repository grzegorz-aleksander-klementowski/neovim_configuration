-- Check if we're using a text terminal (Alacritty, xfce, linux, or Terminator)
local term = os.getenv("TERM") or "undefined"
local text_terminals = term:find("alacritty") or term:find("xfce") or term:find("linux") or term:find("terminator")

-- Functions for lualine components
local function lsp_client()
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then return "No LSP" end
  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  return "LSP: " .. table.concat(names, ", ")
end

local function macro_recording()
  local recording = vim.fn.reg_recording()
  if recording == "" then return "" end
  return " Recording @" .. recording
end

local function search_count()
  local result = vim.fn.searchcount({ maxcount = 999, timeout = 500 })
  if result.total == 0 then return "" end
  return string.format("[%d/%d]", result.current, result.total)
end

-- Default lualine configuration
local lualine_config = {
  options = {
    theme = "gruvbox",
    icons_enabled = true,
    globalstatus = true,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = { "dashboard", "NvimTree", "packer", "alpha" },
  },
  sections = {
    lualine_a = {
      { "mode", fmt = function(str) return str:sub(1, 1) end }
    },
    lualine_b = {
      { "branch", icon = "" },
      { "diff", symbols = { added = " ", modified = "", removed = " " } },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", hint = " ", info = " " }
      }
    },
    lualine_c = {
      { "filename", path = 1, symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" } },
      { search_count },
      { macro_recording },
    },
    lualine_x = {
      { lsp_client, icon = "" },
      "encoding",
      { "fileformat", symbols = { unix = "", dos = "", mac = "" } },
      "filetype",
    },
    lualine_y = {
      "progress",
      { "location", icon = "" }
    },
    lualine_z = {
      { function() return os.date('%H:%M:%S') end, icon = "" }
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { "quickfix", "nvim-tree", "fugitive", "toggleterm" }
}

-- Text terminal overrides
if text_terminals then
  lualine_config.options.section_separators = { left = "", right = "<" }
  lualine_config.options.component_separators = { left = "|", right = "|" }
  if lualine_config.sections.lualine_b[1] then
    lualine_config.sections.lualine_b[1].icon = "BR"
  end
  if lualine_config.sections.lualine_b[2] and lualine_config.sections.lualine_b[2].symbols then
    lualine_config.sections.lualine_b[2].symbols.added = "+"
    lualine_config.sections.lualine_b[2].symbols.modified = "~"
    lualine_config.sections.lualine_b[2].symbols.removed = "-"
  end
  if lualine_config.sections.lualine_b[3] and lualine_config.sections.lualine_b[3].symbols then
    lualine_config.sections.lualine_b[3].symbols.error = "🚨"
    lualine_config.sections.lualine_b[3].symbols.warn = "⚠️"
    lualine_config.sections.lualine_b[3].symbols.hint = "💡"
    lualine_config.sections.lualine_b[3].symbols.info = "ℹ️"
  end
  if lualine_config.sections.lualine_x[1] then
    lualine_config.sections.lualine_x[1].icon = "LSP"
  end
  if lualine_config.sections.lualine_x[3] and lualine_config.sections.lualine_x[3].symbols then
    lualine_config.sections.lualine_x[3].symbols.unix = "UNIX"
    lualine_config.sections.lualine_x[3].symbols.dos = "DOS"
    lualine_config.sections.lualine_x[3].symbols.mac = "MAC"
  end
  if lualine_config.sections.lualine_y[2] then
    lualine_config.sections.lualine_y[2].icon = "Loc"
  end
  if lualine_config.sections.lualine_z[1] then
    lualine_config.sections.lualine_z[1].icon = "⏰"
  end
end

-----------------------------------------------------------------
-- Add the lsp_signature component from our separate module
-----------------------------------------------------------------
local lsp_signature = require("plugins.lsp_signature")
table.insert(lualine_config.sections.lualine_c, {
  function() return lsp_signature.status_signature(40) end,
  color = { fg = "#ff9e64" },
})

-- Finalize lualine with the combined configuration
require("lualine").setup(lualine_config)
