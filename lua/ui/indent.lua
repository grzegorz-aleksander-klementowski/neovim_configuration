local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require("ibl.hooks")

-- 🖍 Define colors for indent levels (dyslexia-friendly: high contrast)
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#E06C75", nocombine = true })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B", nocombine = true })
    vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#61AFEF", nocombine = true })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66", nocombine = true })
    vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#98C379", nocombine = true })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD", nocombine = true })
    vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#56B6C2", nocombine = true })
end)

require("ibl").setup {
    indent = {
        char = "│",                -- Clean, simple indent guides
        highlight = highlight,      -- Rainbow-colored guides for clarity
        smart_indent_cap = true,    -- Avoids unnecessary extra guides
    },
    whitespace = {
        highlight = { "Whitespace" },  -- Shows whitespace errors
        remove_blankline_trail = true, -- Removes trailing blank lines
    },
    scope = {
        enabled = true,               -- Enables scope highlighting
        show_start = true,            -- Underlines start of scope
        show_end = true,              -- Underlines end of scope
        highlight = highlight,        -- Uses rainbow colors for scope
    },
}

-- 🚀 Enable high-visibility scope highlighting (Treesitter-based)
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

