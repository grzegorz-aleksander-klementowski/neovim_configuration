-- -- Kierownik wtyczek (plugin manager/pluign procurator)
require("kierownik-wtyczek")      -- Lazy.nvim
--
-- -- Wczytuje moduły rdzenia (Load Core Modules)
require("core.options")		-- Essential Vim settings
require("core.keymaps")		-- Load keybindings
require("core.autocommands")	-- Automation rules
--
-- -- Wcyztuje Układ wtyczek (Load Plugin System)
require("plugins.lsp")			  -- Spiski Usługajnika Języków (Language Sever Protocol → LSP)
require("plugins.treesitter") 		  -- Selection object tool
require("plugins.statusline")             -- Status line confuguration (ei. for lualine plugin)
require("plugins.autopairs")              -- Pair brackers etc tool
require("plugins.cmp-config")             -- Autocomplete tool. It use lazy load in `./lua/plugins/lazy.lua`
require("plugins.show-keybindings")       -- Pokazuje skróty naciskowe
require("plugins.comments")               -- Easy way to comments
require("plugins.numb_check_jumped_line") -- shows numbers of jumped line
require("plugins.nvim-tree")              -- Neovim Tree settings
require("plugins.notifications")          -- Notification andstatus widget
require("plugins.mason")                  -- LSP package manager
--
-- -- Wczutuje Ustawiony Wygląd (Load Apperance Settings)
require("ui.colors")      -- Ustawione kraśniki (color settings)
require("ui.indent")        -- Pokazuje wcięcia za pomocą pionowych linii.
--
-- -- Wczytuje ustawiania formatu
require("utils/format")
--

