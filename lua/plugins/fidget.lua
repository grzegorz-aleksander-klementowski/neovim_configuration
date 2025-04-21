-- fidget plugin configuration mostly
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
    history_size = 248,           -- Keep last 248 notifications
    override_vim_notify = false,  -- ← stop sending progress into vim.notify()
    configs = { default = require("fidget.notification").default_config },
    -- redirect block removed entirely
  },

  -- Plugin Integrations
  integration = {
    ["nvim-tree"] = { enable = true },
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

-- Keep nvim-notify setup (if you still use it elsewhere)
require("notify").setup({
  background_colour = "#1e1e2e",
})

-- Command to inspect captured fidget messages
vim.api.nvim_create_user_command("ShowFidgetNotifications", function()
  local messages = _G.fidget_notifications or {}
  if #messages == 0 then
    vim.notify("No Fidget notifications captured yet.", vim.log.levels.INFO)
    return
  end

  local lines = {}
  for i, item in ipairs(messages) do
    local line = string.format("[%d] %s | %s", i, item.time, item.message:gsub("\n", " "))
    table.insert(lines, line)
  end

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
