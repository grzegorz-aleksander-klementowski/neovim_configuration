
-- Which-Key Nvim plugin

local wk = require("which-key")

wk.add({
  -- File Management Group
  { "<leader>f", group = "file" }, -- Group for file-related commands
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", mode = "n" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers", mode = "n" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files", mode = "n" },
  { "<leader>fn", desc = "New File" },
  { "<leader>f1", hidden = true }, -- Hide this keymap

  -- Window Management
  { "<leader>w", "<cmd>w<cr>", desc = "Save File", mode = "n" }, -- Save file
  { "<leader>w", proxy = "<c-w>", group = "windows" }, -- Proxy to window mappings

  -- Buffer Management
  { "<leader>b", group = "buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end
  },

  -- Quit & Exit
  { "<leader>q", "<cmd>q<cr>", desc = "Quit", mode = "n" }, -- Quit
  { "<leader>x", "<cmd>x<cr>", desc = "Save & Quit", mode = "n" }, -- Save & Quit

  -- File Explorer
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer", mode = "n" },

  -- Git Commands (Group)
  { "<leader>g", group = "git" }, -- Group for Git-related commands
  { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status", mode = "n" },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits", mode = "n" },

  -- Autopairs (Previously Added)
  { "<leader>a", group = "autopairs" }, -- Group for Autopair-related mappings
  { "<M-e>", desc = "Fast Wrap", mode = "i" }, -- Alt+e for wrapping text
  { "<CR>", desc = "Auto Close Brackets", mode = "i" }, -- Enter key for auto-closing brackets
  { "<BS>", desc = "Remove Pair", mode = "i" }, -- Backspace to remove paired brackets

  -- Treesitter (New Group)
  { "<leader>t", group = "treesitter" }, -- Group for Treesitter keybindings
  { "<leader>tt", desc = "Start Incremental Selection", mode = "n" },
  { "<leader>tg", desc = "Expand Incremental Selection", mode = "n" },
  { "<leader>th", desc = "Shrink Incremental Selection", mode = "n" },
  { "<leader>tf", desc = "Smart Rename (Refactor)", mode = "n" },
})



