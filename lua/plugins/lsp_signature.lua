-- lua/plugins/lsp_signature.lua
--
-- This file configures lsp_signature.nvim and provides a helper function
-- for integrating the signature information into your lualine statusline.
--

local M = {}

local cfg = {
  debug = false,                                              -- disable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log file location
  verbose = false,                                            -- disable verbose logging

  -- **MANDATORY OPTIONS**
  bind = true, -- binds the signature handler (required for setting the border, etc.)

  -- **Documentation Options**
  doc_lines = 10,  -- shows up to 10 lines of documentation (set to 0 to hide)
  max_height = 12, -- maximum height of the floating window
  max_width = function()
    return vim.api.nvim_win_get_width(0) * 0.8
  end,                                   -- maximum width is 80% of current window width

  wrap = true,                           -- allow text wrapping inside the floating window
  floating_window = true,                -- use a floating window for the signature
  floating_window_above_cur_line = true, -- prefer floating the window above the cursor line if possible

  -- **Floating Window Offset Options**
  floating_window_off_x = 5, -- horizontal offset (can be a number or function)
  floating_window_off_y = function()
    -- Calculate y offset based on current position relative to popup height and window height
    local linenr = vim.api.nvim_win_get_cursor(0)[1]
    local pumheight = vim.o.pumheight
    local winline = vim.fn.winline()
    local winheight = vim.fn.winheight(0)
    if winline - 1 < pumheight then
      return pumheight
    elseif winheight - winline < pumheight then
      return -pumheight
    else
      return 0
    end
  end,

  close_timeout = 4000, -- timeout (in ms) to auto-close the floating window when the last parameter is entered
  fix_pos = false,      -- if true, the floating window will not auto-close until all parameters are entered

  -- **Hint Options**
  hint_enable = true, -- enable virtual hint display
  hint_prefix = "🤖 ", -- prefix for the hint (feel free to change the emoji or text)
  hint_scheme = "String", -- highlight group for the hint
  hint_inline = function() return false end, -- disable inline hints (set to true or 'eol' or 'right_align' if desired)
  hi_parameter = "LspSignatureActiveParameter", -- highlight group for the active parameter

  -- **Floating Window Appearance**
  handler_opts = {
    border = "rounded", -- set the floating window border style
  },

  -- **Additional Options**
  always_trigger = false,
  auto_close_after = nil,
  extra_trigger_chars = {},        -- extra characters to trigger signature help (if any)
  zindex = 200,                    -- z-index for the floating window (ensures it appears on top)
  padding = '',                    -- left/right padding inside the signature
  transparency = nil,              -- transparency (if supported), set to a value between 1 and 100 if desired
  shadow_blend = 36,               -- if you use a shadow as border, adjust its opacity
  shadow_guibg = 'Black',          -- background color for the shadow
  timer_interval = 200,            -- frequency of checking for signature updates (in ms)

  toggle_key = nil,                -- optional keybinding to toggle signature help
  toggle_key_flip_floatwin_setting = false,
  select_signature_key = nil,      -- key to cycle through multiple signatures (overloads)
  move_signature_window_key = nil, -- key(s) to move the floating window if needed
  move_cursor_key = nil,           -- key to move the cursor to the floating window
  keymaps = {},                    -- additional keymaps for the floating window (if desired)
}

-- Initialize lsp_signature with our configuration
require('lsp_signature').setup(cfg)

--------------------------------------------------------------------------------
-- Signature Helper for lualine
--
-- Call this function from your lualine configuration to display the current
-- signature information (if available) in your statusline.
--------------------------------------------------------------------------------
function M.status_signature(max_width)
  local ok, sig = pcall(require, 'lsp_signature')
  if not ok then
    return ""
  end

  -- 'max_width' is optional; you might pass a value based on your statusline needs
  local status = sig.status_line(max_width or 40)
  if status and status.label and status.hint then
    return status.label .. "🤖" .. status.hint
  end

  return ""
end

return M
