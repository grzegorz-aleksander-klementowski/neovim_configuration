-- lua/plugins/noice.lua
return {
  "folke/noice.nvim",
  event = "VeryLazy",       -- or whatever trigger you prefer
  dependencies = {
    "MunifTanjim/nui.nvim", -- required UI components
    "rcarriga/nvim-notify", -- optional notification backend
  },
  -- these opts get passed straight to require("noice").setup()
  opts = {
    lsp = {
      -- override markdown rendering so cmp, etc. use Treesitter
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"]                = true,
        ["cmp.entry.get_documentation"]                  = true,
      },
    },
    presets = {
      bottom_search         = true,  -- classic bottom cmdline for search
      command_palette       = true,  -- position cmdline & popupmenu together
      long_message_to_split = true,  -- long messages go to a split
      inc_rename            = false, -- disable built‑in inc‑rename UI
      lsp_doc_border        = false, -- no border on hover/signature
    },
  },
}
