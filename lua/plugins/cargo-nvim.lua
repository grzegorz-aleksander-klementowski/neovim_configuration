-- lua/plugins/cargo.lua
require("cargo").setup({
  -- Window settings
  float_window = true, -- Use floating window
  window_width = 0.8,  -- Window width (80% of editor width)
  window_height = 0.8, -- Window height (80% of editor height)
  border = "rounded",  -- Border style ("none", "single", "double", "rounded")

  -- Auto-close settings
  auto_close = true,    -- Auto close window on success
  close_timeout = 5000, -- Close window after 5000ms

  -- Command settings
  commands = {
    bench = { nargs = "*" }, -- Command arguments configuration
    build = { nargs = "*" },
    clean = { nargs = "*" },
    doc = { nargs = "*" },
    new = { nargs = 1 },
    run = { nargs = "*" },
    test = { nargs = "*" },
    update = { nargs = "*" },
  }
})
