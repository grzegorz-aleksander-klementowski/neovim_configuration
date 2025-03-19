require("Comment").setup({
    -- Enable or disable features
    padding = true,  -- Add a space between comment and text
    sticky = true,   -- Keeps the cursor in place after commenting

    -- Integrate with Treesitter for smarter commenting
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),

    -- Comment toggling keybindings
    toggler = {
        line = "gcc",  -- Toggle line comment
        block = "gbc", -- Toggle block comment
    },

    -- Operator-pending mappings (allows `gc` + motion)
    opleader = {
        line = "gc",
        block = "gb",
    },

    -- Extra mappings
    extra = {
        above = "gcO", -- Comment above
        below = "gco", -- Comment below
        eol = "gcA",   -- Comment at end of line
    },

    -- Adjust comment style per filetype
    mappings = {
        basic = true,      -- Enable default `gcc` and `gbc` mappings
        extra = true,      -- Enable `gcO`, `gco`, `gcA`
        extended = false,  -- Don't need extended mappings
    },

    -- Post-hook function (e.g., refresh UI)
    post_hook = function()
        vim.cmd("doautocmd BufWritePost")  -- Auto-refresh buffer after commenting
    end,
})

