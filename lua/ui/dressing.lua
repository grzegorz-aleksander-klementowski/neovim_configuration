return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = function()
    -- now telescope.nvim is definitely installed and on the path
    local themes = require("telescope.themes")
    return {
      input = {
        insert_only     = false,
        start_in_insert = true,
        border          = "rounded",
        win_options     = { winblend = 10 },
      },
      select = {
        backend   = { "telescope", "builtin" },
        telescope = themes.get_cursor(), -- safe to call here
        builtin   = { border = "rounded", max_width = 80 },
      },
    }
  end,
}
