-- Check if we're using a text terminal (Alacritty, xfce, or linux)
local term = os.getenv("TERM") or "undefined"
local term_program = os.getenv("TERM_PROGRAM") or "undefined"
local text_terminals = term:find("alacritty") or term:find("xfce") or term:find("linux") or
    term:find("terminator")

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

-- Default lualine configuration (unchanged)
local lualine_config = {
  options = {
    theme = "gruvbox",   -- change to change whole NeoVim color theme
    icons_enabled = true,
    globalstatus = true, -- One status line for all windows
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = { "dashboard", "NvimTree", "packer", "alpha" },
  },
  sections = {
    lualine_a = {
      { "mode", fmt = function(str) return str:sub(1, 1) end } -- Shortened mode (N, I, V)
    },
    lualine_b = {
      { "branch", icon = "" }, -- Git branch
      { "diff", symbols = { added = " ", modified = "", removed = " " } }, -- Git changes
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", hint = " ", info = " " }
      } -- LSP diagnostics
    },
    lualine_c = {
      {
        "filename",
        path = 1, -- 0 = filename, 1 = relative path, 2 = absolute path
        symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" }
      },
      { search_count },    -- Shows search results if searching
      { macro_recording }, -- Shows macro recording status
    },
    lualine_x = {
      { lsp_client, icon = "" },
      "encoding",
      { "fileformat", symbols = { unix = "", dos = "", mac = "" } },
      "filetype",
    },
    lualine_y = {
      "progress",
      { "location", icon = "" } -- Cursor position
    },
    lualine_z = {
      { function() return os.date('%H:%M:%S') end, icon = "" } -- Wrapped clock in a function
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

-- If using a text terminal, override icons with text-based or emoji versions.
if text_terminals then
  -- Override section and component separators with simple text alternatives.
  lualine_config.options.section_separators = { left = "", right = "<" }
  lualine_config.options.component_separators = { left = "|", right = "|" }

  -- In section lualine_b: override branch, diff, and diagnostic symbols.
  if lualine_config.sections.lualine_b[1] then
    lualine_config.sections.lualine_b[1].icon = "BR" -- Replace branch icon with text
  end
  if lualine_config.sections.lualine_b[2] and lualine_config.sections.lualine_b[2].symbols then
    lualine_config.sections.lualine_b[2].symbols.added = "+"
    lualine_config.sections.lualine_b[2].symbols.modified = "~"
    lualine_config.sections.lualine_b[2].symbols.removed = "-"
  end
  if lualine_config.sections.lualine_b[3] and lualine_config.sections.lualine_b[3].symbols then
    lualine_config.sections.lualine_b[3].symbols.error = "🚨" -- Emoji for errors
    lualine_config.sections.lualine_b[3].symbols.warn = "⚠️" -- Emoji for warnings
    lualine_config.sections.lualine_b[3].symbols.hint = "💡" -- Emoji for hints
    lualine_config.sections.lualine_b[3].symbols.info = "ℹ️" -- Emoji for info
  end

  -- In section lualine_x: override LSP and fileformat symbols.
  if lualine_config.sections.lualine_x[1] then
    lualine_config.sections.lualine_x[1].icon = "LSP"
  end
  if lualine_config.sections.lualine_x[3] and lualine_config.sections.lualine_x[3].symbols then
    lualine_config.sections.lualine_x[3].symbols.unix = "UNIX"
    lualine_config.sections.lualine_x[3].symbols.dos = "DOS"
    lualine_config.sections.lualine_x[3].symbols.mac = "MAC"
  end

  -- In sections lualine_y and lualine_z: override location and clock icons.
  if lualine_config.sections.lualine_y[2] then
    lualine_config.sections.lualine_y[2].icon = "Loc"
  end
  if lualine_config.sections.lualine_z[1] then
    lualine_config.sections.lualine_z[1].icon = "⏰"
  end
end

-- Set up lualine with the final configuration.
require("lualine").setup(lualine_config)
