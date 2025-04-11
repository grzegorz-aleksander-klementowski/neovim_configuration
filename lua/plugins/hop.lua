-- lua/plugins/hop.lua

return {
  'phaazon/hop.nvim', -- Use the official repository
  branch = 'v2',      -- Use the v2 branch for the latest features
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
  config = function(_, opts)
    local hop = require('hop')
    local directions = require('hop.hint').HintDirection

    hop.setup(opts)

    -- Character-based hints on the current line
    vim.keymap.set('', 'f', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    end, { remap = true, desc = "Hop: hint char after cursor" })

    vim.keymap.set('', 'F', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    end, { remap = true, desc = "Hop: hint char before cursor" })

    vim.keymap.set('', 't', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
    end, { remap = true, desc = "Hop: hint char after cursor (target mode)" })

    vim.keymap.set('', 'T', function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
    end, { remap = true, desc = "Hop: hint char before cursor (target mode)" })

    -- Word-based hints across the window
    vim.keymap.set('', 's', function()
      hop.hint_words({ current_line_only = false })
    end, { remap = true, desc = "Hop: hint words" })

    -- Line-based hints anywhere in the window
    vim.keymap.set('', 'S', function()
      hop.hint_lines({ current_line_only = false, direction = directions.AFTER_CURSOR })
    end, { remap = true, desc = "Hop: hint lines" })

    -- Optional: Leader key mappings for hop commands in normal mode
    vim.keymap.set('n', '<leader>hw', function()
      hop.hint_words({ current_line_only = false })
    end, { desc = "Hop: hint words (leader)" })

    vim.keymap.set('n', '<leader>hl', function()
      hop.hint_lines({ current_line_only = false, direction = directions.AFTER_CURSOR })
    end, { desc = "Hop: hint lines (leader)" })
  end,
}
