-- Automation rules

-- 🔄 AUTO TRIM WHITESPACE ON SAVE
vim.cmd([[ autocmd BufWritePre * %s/\s\+$//e ]])

-- 📜 FILETYPE-SPECIFIC RULES
vim.cmd([[
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
    autocmd FileType lua setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType rust setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
    autocmd FileType markdown setlocal wrap
]])

-- 📂 AUTO-CLOSE UNUSED WINDOWS
vim.cmd([[ autocmd BufEnter * if winnr('$') == 1 && &buftype == 'quickfix' | q | endif ]]) -- Closes quickfix when done

