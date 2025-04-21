-- lua/ui/noice.lua
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    ---------------------------
    -- LSP Overrides & UI
    ---------------------------
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"]                = true,
        ["cmp.entry.get_documentation"]                  = true,
      },
      hover = { enabled = true, view = "popup", opts = { border = { style = "rounded" } } },
      signature = { enabled = true, view = "popup", opts = { border = { style = "rounded" } } },
      message = { enabled = true, view = "notify" },
      documentation = {
        view = "popup",
        opts = {
          border = { style = "rounded" },
          win_options = { winblend = 10 },
          format = { "{message}" },
        },
      },
    },

    ---------------------------
    -- LSP Progress Indicator
    ---------------------------
    progress = {
      enabled = true,
      -- use a minimal inline view so it doesn't steal focus
      view = "mini",
      throttle = 1000 / 60, -- update at up to 60fps
      format = { "{spinner} {title}: {percentage:3p}" },
      format_done = { "{title} completed" },
    },

    ---------------------------
    -- Presets
    ---------------------------
    presets = {
      bottom_search         = true, -- remap `:` to search UI at bottom
      command_palette       = true, -- use popup for commands
      long_message_to_split = true, -- sent long messages to a split
      inc_rename            = true, -- enables inc-rename UI
      lsp_doc_border        = true, -- add border for hover docs
    },

    ---------------------------
    -- Command Line
    ---------------------------
    cmdline = {
      enabled      = true,
      view         = "cmdline_popup",
      format       = {
        cmdline     = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " " },
        search_up   = { kind = "search", pattern = "^%?", icon = " " },
        lua         = { pattern = { "^:%s*lua" }, icon = "", lang = "lua" },
        filter      = { pattern = "^:%s*!", icon = "", lang = "bash" },
        help        = { pattern = "^:%s*he?l?p?%s+", icon = "❔" },
      },
      view_options = { border = { style = "rounded" } },
    },

    ---------------------------
    -- Messages
    ---------------------------
    messages = {
      enabled       = true,
      view          = "notify",
      view_error    = "popup",
      view_warn     = "popup",
      view_history  = "split",
      view_search   = "virtualtext",
      popup_options = { border = { style = "rounded" }, winblend = 5 },
    },

    ---------------------------
    -- Popup Menu
    ---------------------------
    popupmenu = {
      enabled = true,
      backend = "nui",
      icons = {
        kind = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "ﰠ",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "ﰠ",
          Unit = "塞",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "פּ",
          Event = "",
          Operator = "",
          TypeParameter = "",
        },
      },
    },

    ---------------------------
    -- Notification Routing
    ---------------------------
    notify = { enabled = true, view = "notify" },

    routes = {
      -- underline errors inline only
      {
        filter = { event = "msg_show", kind = "error" },
        view   = "popup",
        opts   = { border = { style = "rounded" } },
      },
      -- virtual text for search matches
      {
        filter = { event = "search" },
        view   = "virtualtext",
      },
      -- skip trivial confirm messages
      {
        filter = { event = "msg_show", find = "written" },
        opts   = { skip = true },
      },
    },

    ---------------------------
    -- Throttle & Health
    ---------------------------
    throttle = 1000 / 60,
    health = { checker = true },
  },

  config = function(_, opts)
    require("noice").setup(opts)
  end,
}
