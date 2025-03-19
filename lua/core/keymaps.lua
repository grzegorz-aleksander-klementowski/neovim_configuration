-- Wszystkie przypisane przez użytkownika skrótów naciskowych (ang.: keybindings)


-- 🏎️ SPLIT NAVIGATION
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true }) -- Move between splits
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- 🎯 CODE FOLDING
vim.keymap.set("n", "<leader>z", "za", { silent = true }) -- Toggle fold with `<leader>z`

-- 🔄 AUTO-CORRECT COMMON COMMAND TYPOS
vim.cmd([[ cnoreabbrev W w ]])
vim.cmd([[ cnoreabbrev Q q ]])
vim.cmd([[ cnoreabbrev WQ wq ]])
vim.cmd([[ cnoreabbrev Wq wq ]])


-- Set Leader Key
vim.g.mapleader = " "  -- Space as Leader
vim.g.maplocalleader = " "  -- Local Leader also Space




-- **→ SKRÓTY NACISKOWE ←** --


-- Układ Poleceń NeoVim
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })  -- Save file
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })  -- Quit
vim.keymap.set("n", "<leader>x", ":x<CR>", { silent = true })  -- Save & Quit

--Układ Poleceń Wtyczek
-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true })  -- Find files
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { silent = true })  -- Search text
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { silent = true })  -- Open buffers
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { silent = true })  -- Recent files
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { silent = true })  -- Git status
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { silent = true })  -- Git commits

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true }) -- Open/Close
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { silent = true }) -- Refresh tree
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", { silent = true }) -- Focus on current file
