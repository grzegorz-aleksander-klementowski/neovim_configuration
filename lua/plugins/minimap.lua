return {
  "wfxr/minimap.vim",

  config = function()
    -- Basic minimap options
    vim.g.minimap_auto_start = 1
    vim.g.minimap_auto_start_win_enter = 1
    vim.g.minimap_width = 20
    vim.g.minimap_left = 0
    vim.g.minimap_highlight_range = 1
    vim.g.minimap_highlight_search = 1
    vim.g.minimap_background_processing = 1
    vim.g.minimap_git_colors = 1

    -- Filetype and buffer type settings
    vim.g.minimap_block_filetypes = { "fugitive", "nerdtree", "tagbar", "fzf" }
    vim.g.minimap_block_buftypes = { "nofile", "nowrite", "quickfix", "terminal", "prompt" }
    vim.g.minimap_close_filetypes = { "startify", "netrw", "vim-plug" }
    vim.g.minimap_close_buftypes = {}

    vim.g.minimap_exec_warning = 1
    vim.g.minimap_enable_highlight_colorgroup = 1

    -- Color group options
    vim.g.minimap_search_color_priority = 120
    vim.g.minimap_cursor_color_priority = 110
    vim.g.minimap_cursor_color = "minimapCursor"
    vim.g.minimap_range_color = "minimapRange"
    vim.g.minimap_search_color = "Search"
    vim.g.minimap_diffadd_color = "minimapDiffAdded"
    vim.g.minimap_diffremove_color = "minimapDiffRemoved"
    vim.g.minimap_diff_color = "minimapDiffLine"
    vim.g.minimap_cursor_diffadd_color = "minimapCursorDiffAdded"
    vim.g.minimap_cursor_diffremove_color = "minimapCursorDiffRemoved"
    vim.g.minimap_cursor_diff_color = "minimapCursorDiffLine"
    vim.g.minimap_range_diffadd_color = "minimapRangeDiffAdded"
    vim.g.minimap_range_diffremove_color = "minimapRangeDiffRemoved"
    vim.g.minimap_range_diff_color = "minimapRangeDiffLine"
  end,
}
