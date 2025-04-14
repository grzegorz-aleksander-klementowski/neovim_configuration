-- lua/plugins/lspsaga.lua
return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",                 -- or another event like "BufReadPost" as needed
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons",     -- optional
  },
  config = function()
    require("lspsaga").setup({
      code_action = {
        show_server_name = true, -- Display the LSP server name for code actions.
      },
      lightbulb = {
        enable = true,      -- Automatically show the lightbulb when code actions are available.
        sign = true,        -- Use the sign column for the lightbulb indicator.
        sign_priority = 20, -- Set a higher priority for the sign.
      },
      hover = {
        auto_focus = true, -- Automatically focus the hover window.
      },
      rename = {
        in_select = false, -- Directly initiate renaming without a selection prompt.
      },
      -- Add more customizations if needed.
    })

    -- Optional key mappings:
    vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, desc = "LSP Code Action" })
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, desc = "LSP Hover Documentation" })
    vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true, desc = "LSP Finder" })
  end,
}
