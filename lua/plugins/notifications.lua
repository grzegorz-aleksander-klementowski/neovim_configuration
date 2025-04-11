require("fidget").setup({
  -- Configure LSP Progress Notifications
  progress = {
    poll_rate = 0,               -- Instant updates (no artificial delay)
    suppress_on_insert = true,   -- No distractions while typing
    ignore_done_already = true,  -- No duplicate messages for completed tasks
    ignore_empty_message = true, -- Don't show useless "empty" progress updates
    clear_on_detach = function(client_id)
      local client = vim.lsp.get_client_by_id(client_id)
      return client and client.name or nil
    end,
    notification_group = function(msg)
      return msg.lsp_client.name
    end,
    ignore = { "null-ls" }, -- Ignore spammy LSPs that don't provide useful updates

    -- Display Configuration
    display = {
      render_limit = 10, -- Show only 10 concurrent messages to prevent spam
      done_ttl = 2, -- Completed messages disappear after 2s
      done_icon = "✔", -- Success icon
      done_style = "Constant", -- Highlight group for completed messages
      progress_ttl = math.huge, -- Keep progress messages until completed
      progress_icon = { "dots" }, -- Animated dots while processing
      progress_style = "WarningMsg",
      group_style = "Title",
      icon_style = "Question",
      priority = 50,       -- High priority so it's always visible
      skip_history = true, -- Don't pollute history with progress messages
      format_message = require("fidget.progress.display").default_format_message,
      format_annote = function(msg)
        return msg.title
      end,
      format_group_name = function(group)
        return tostring(group)
      end,
      overrides = {
        rust_analyzer = { name = "Rust Analyzer" },
      },
    },

    -- LSP-Specific Behavior
    lsp = {
      progress_ringbuf_size = 16, -- Store recent progress messages for efficiency
      log_handler = false,        -- Disable LSP log spam
    },
  },

  -- Configure General Notifications
  notification = {
    poll_rate = 5,                -- Refresh rate for notifications
    filter = vim.log.levels.INFO, -- Only show relevant notifications
    history_size = 124,           -- Keep last 124 notifications
    override_vim_notify = true,   -- Redirect `vim.notify()` to Fidget
    configs = { default = require("fidget.notification").default_config },
    redirect = function(msg, level, opts)
      -- Store all notifications for later viewing
      _G.fidget_notifications = _G.fidget_notifications or {}
      table.insert(_G.fidget_notifications, {
        message = msg,
        level = level,
        opts = opts,
        time = os.date(),
      })
      return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
    end,

    -- Notification View
    view = {
      stack_upwards = false, -- Messages stack from bottom
      icon_separator = " ", -- Space between icon and message
      group_separator = "—", -- Separator for grouped messages
      group_separator_hl = "Comment",
      render_message = function(msg, cnt)
        return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
      end,
    },

    -- Notification Window Configuration
    window = {
      normal_hl = "Comment", -- Base highlight group
      winblend = 15,         -- Slight transparency
      border = "rounded",    -- Rounded border for clarity
      zindex = 50,           -- Ensure it's above other UI elements
      -- max_width = 50,          -- Limit width to avoid clutter
      -- max_height = 10,         -- Prevent notifications from taking over screen
      x_padding = 1,          -- Slight padding on right
      y_padding = 0,          -- No padding on bottom
      align = "bottom-right", -- Set bottom-right placement
      relative = "editor",
    },
  },

  -- Plugin Integrations
  integration = {
    ["nvim-tree"] = { enable = true }, -- Show notifications inside nvim-tree
    ["xcodebuild-nvim"] = { enable = false },
  },

  -- Logging (Optimized)
  logger = {
    level = vim.log.levels.WARN, -- Only log warnings and errors
    max_size = 5000,             -- Limit log size to prevent bloating
    float_precision = 0.01,      -- Precision for float values
    path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
  },
})


vim.api.nvim_create_user_command("ShowFidgetNotifications", function()
  local messages = _G.fidget_notifications or {}
  if #messages == 0 then
    vim.notify("No Fidget notifications captured yet.", vim.log.levels.INFO)
    return
  end

  -- Format messages nicely
  local lines = {}
  for i, item in ipairs(messages) do
    local line = string.format("[%d] %s | %s", i, item.time, item.message)
    table.insert(lines, line)
  end

  -- Create a scratch buffer and floating window
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = 80,
    height = math.min(#lines, 20),
    row = 3,
    col = 10,
    style = "minimal",
    border = "rounded",
  })
end, {})
