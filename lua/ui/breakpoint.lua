-- 1) Define the sign once
vim.fn.sign_define("BreakpointSign", {
  text = "🛑",
  texthl = "Error", -- highlight group for the icon
  linehl = "",      -- no line highlight
  numhl = "",       -- no number highlight
})

-- 2) A function to toggle the sign on the current line
local function toggle_breakpoint()
  local bufnr  = vim.api.nvim_get_current_buf()
  local lnum   = vim.api.nvim_win_get_cursor(0)[1]

  -- check if there's already a sign here
  local placed = vim.fn.sign_getplaced(bufnr, {
    group = "breakpoints",
    lnum  = lnum,
  })[1].signs

  if #placed > 0 then
    -- remove it
    vim.fn.sign_unplace("breakpoints", { buffer = bufnr, id = lnum })
  else
    -- place it (use line number as unique ID)
    vim.fn.sign_place(lnum, "breakpoints", "BreakpointSign", bufnr, { lnum = lnum })
  end
end

-- 3) Expose it as a command and keymap
vim.api.nvim_create_user_command("ToggleBreakpoint", toggle_breakpoint, {})
vim.keymap.set("n", "<leader>bp", toggle_breakpoint, {
  desc = "Toggle Breakpoint Sign",
  silent = true,
})

