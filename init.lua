-- -- Kierownik wtyczek (plugin manager/pluign procurator)
require("kierownik-wtyczek") -- Lazy.nvim
--
-- -- Wczytuje moduły rdzenia (Load Core Modules)
require("core.options")      -- Essential Vim settings
require("core.keymaps")      -- Load keybindings
require("core.autocommands") -- Automation rules
--
-- -- Wcyztuje Układ wtyczek (Load Plugin System)
require("plugins.lsp")                          -- Spiski Usługajnika Języków (Language Sever Protocol → LSP)
require("plugins.treesitter")                   -- Selection object tool
require("plugins.statusline")                   -- Status line confuguration (ei. for lualine plugin)
require("plugins.autopairs")                    -- Pair brackers etc tool
require("plugins.cmp-config")                   -- Autocomplete tool. It use lazy load in `./lua/plugins/lazy.lua`
require("plugins.show-keybindings")             -- Pokazuje skróty naciskowe
require("plugins.comments")                     -- Easy way to comments
require("plugins.numb_check_jumped_line")       -- shows numbers of jumped line
require("plugins.nvim-tree")                    -- Neovim Tree settings
require("plugins.notifications")                -- Notification andstatus widget
require("plugins.mason")                        -- LSP package manager
require("plugins.colorizer")                    -- Colorize Hex and other color codes
require("plugins.lsp_signature")                -- Add additional infos on the variables (signatures) in a floating window
require("plugins.projects_nvim")                -- Configuring the rearching for the projects
require("plugins.gitsigns")                     -- COnfiguring how to show git changes
require("plugins.virt-column")                  -- Set vertical line that point the end of line avaible to text
require("plugins.minimap")                      -- Mimimap config by „codewindow.nvim”
local status, crates = pcall(require, "crates") -- Makes inbuild cargo a floating window. Manually initialize crates.nvim after plugins have loaded.
if status then
  crates.setup()
else
  vim.notify("crates.nvim plugin is not available", vim.log.levels.ERROR)
end

-- -- Wczutuje Ustawiony Wygląd (Load Apperance Settings)
require("ui.colors")     -- Ustawione kraśniki (color settings)
require("ui.indent")     -- Pokazuje wcięcia za pomocą pionowych linii.
require("ui.cursor")     -- ustawia wskaźnik oraz linię, gdzie leży wskaźnik
require("ui.breakpoint") -- Ustawia kropkę do zaznaczania linii
--
-- -- Wczytuje ustawiania formatu
require("utils/format")
