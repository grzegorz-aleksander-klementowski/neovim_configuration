-- Ensure nvim-autopairs is installed before loading
local ok, npairs = pcall(require, "nvim-autopairs")
if not ok then
    vim.notify("nvim-autopairs not found", vim.log.levels.WARN)
    return
end

-- Load autopairs with a well-structured setup
npairs.setup({
    check_ts = true,  -- Enable Treesitter integration for better pairing
    disable_filetype = { "TelescopePrompt", "vim" }, -- Prevent conflicts in specific filetypes
    fast_wrap = {
        map = "<M-e>", -- Quickly wrap text (Alt + e)
        chars = { "{", "[", "(", '"', "'" }, -- Characters that trigger wrapping
        pattern = [=[[%'%"%)%>%]%)%}%,]]=], -- Smart detection for wrapping
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl", -- Motion keys for moving inside wrapping
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
    },
    enable_check_bracket_line = false, -- Don't add pairs if next to a closing pair
    ignored_next_char = "[%w%.]", -- Ignore adding pairs if next character is alphanumeric
    map_cr = true, -- Auto-close brackets after pressing enter in a function call
    map_bs = true, -- Allow backspacing to remove pairs
    map_c_w = false, -- Disable `<C-w>` mapping (conflicts with native behavior)
})

-- 🚀 Integrate with `nvim-cmp` for smarter pair completions
local cmp_ok, cmp = pcall(require, "cmp")
if cmp_ok then
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({
        map_char = {
            tex = "", -- No auto-pairing inside LaTeX documents
        }
    }))
end

-- 💀 Custom rule for inserting spaces inside parentheses/brackets
local Rule = require("nvim-autopairs.rule")
npairs.add_rules({
    Rule(" ", " ")
        :with_pair(function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ "()", "{}", "[]" }, pair)
        end)
        :with_move(function(opts)
            return opts.prev_char:match(".%)") ~= nil
        end)
        :use_key(" "),
})

-- 🚀 Custom rule: auto-wrap `*text*` in Markdown
npairs.add_rules({
    Rule("*", "*", "markdown")
        :with_pair(function() return true end)
        :with_move(function(opts) return opts.char == "*" end)
        :use_key("*")
})

-- 🩸 Custom rule: auto-wrap `$math$` in LaTeX
npairs.add_rules({
    Rule("$", "$", "tex")
        :with_pair(function() return true end)
        :with_move(function(opts) return opts.char == "$" end)
        :use_key("$")
})

