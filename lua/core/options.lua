-- Essential Vim options

-- 🌍 SYSTEM INTEGRATION
vim.opt.number = true               -- Enable line numbers
vim.opt.relativenumber = true       -- Show relative line numbers
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard
vim.opt.autoread = true            -- Auto-reload file if changed externally
vim.opt.swapfile = true            -- Enable swap files
vim.opt.backup = true              -- Keep backup files
vim.opt.writebackup = true         -- Backup before overwriting
vim.opt.backupdir = vim.fn.expand("~/.local/share/nvim/backup//")
vim.opt.undofile = true            -- Maintain undo history across sessions

-- 🔍 SEARCH
vim.opt.ignorecase = true          -- Case-insensitive search
vim.opt.smartcase = true           -- Case-sensitive if uppercase letters are used
vim.opt.incsearch = true           -- Show search results while typing
vim.opt.hlsearch = true            -- Highlight search results

-- 📜 INDENTATION & FORMATTING
vim.opt.smartindent = true         -- Auto-indent new lines
vim.opt.autoindent = true          -- Maintain indentation level
vim.opt.cindent = true             -- Better C-style indentation
vim.opt.breakindent = true         -- Keep indentation in wrapped lines
vim.opt.showbreak = "↪ "           -- Mark wrapped lines
vim.opt.termguicolors = false      -- Neovim needs termguicolors enabled to apply colors properly.

-- 🚀 SPLIT NAVIGATION
vim.opt.splitright = true          -- Vertical splits open to the right
vim.opt.splitbelow = true          -- Horizontal splits open below

-- 🌍 JUMP HISTORY
vim.opt.jumpoptions = "stack"      -- Better `<C-o>` and `<C-i>` behavior

-- 🚀 SCROLLING & MOVEMENT
vim.opt.scrolloff = 8              -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8          -- Keep 8 columns left/right
vim.opt.sidescroll = 1             -- Horizontal scroll speed

-- 📜 FILE SEARCHING
vim.opt.path:append("**")          -- Enable recursive search (`:find file`)
vim.opt.wildignore:append({
    "*/node_modules/*", "*/.git/*", "*/.cache/*", "*/build/*", "*/dist/*",
    "*.o", "*.obj", "*.so",
})

vim.opt.signcolumn = "yes"         -- Always show sign column (prevents UI jumps)
