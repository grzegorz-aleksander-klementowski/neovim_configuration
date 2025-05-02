-- lua/plugins/lsp_signature.lua
--
-- This file configures lsp_signature.nvim and provides a helper function
-- for integrating the signature information into your lualine statusline.
--

-- lua/kierownik-wtyczek.lua (or wherever you keep your lazy.nvim spec)
return {
  -- … other plugins …
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      debug                            = false,
      log_path                         = vim.fn.stdpath("cache") .. "/lsp_signature.log",
      verbose                          = false,
      bind                             = true,
      doc_lines                        = 10,
      max_height                       = 12,
      max_width                        = function() return vim.api.nvim_win_get_width(0) * 0.8 end,
      wrap                             = true,
      floating_window                  = true,
      floating_window_above_cur_line   = true,
      floating_window_off_x            = 5,
      floating_window_off_y            = function()
        local linenr = vim.api.nvim_win_get_cursor(0)[1]
        local pumh   = vim.o.pumheight
        local winln  = vim.fn.winline()
        local winh   = vim.fn.winheight(0)
        if winln - 1 < pumh then
          return pumh
        elseif winh - winln < pumh then
          return -pumh
        else
          return 0
        end
      end,
      close_timeout                    = 4000,
      fix_pos                          = false,
      hint_enable                      = true,
      hint_prefix                      = "🤖 ",
      hint_scheme                      = "String",
      hint_inline                      = function() return false end,
      hi_parameter                     = "LspSignatureActiveParameter",
      handler_opts                     = {
        border    = "rounded",
        focusable = false, -- <— prevent the float from stealing focus
        focus     = false,
      },
      always_trigger                   = false,
      auto_close_after                 = 3000,
      extra_trigger_chars              = {},
      zindex                           = 200,
      padding                          = "",
      transparency                     = nil,
      shadow_blend                     = 36,
      shadow_guibg                     = "Black",
      timer_interval                   = 200,
      toggle_key                       = nil,
      toggle_key_flip_floatwin_setting = false,
      select_signature_key             = nil,
      move_signature_window_key        = nil,
      move_cursor_key                  = nil,
      keymaps                          = {},
    },
  },
  -- … other plugins …
}
