local term = os.getenv("TERM") or ""
local term_program = os.getenv("TERM_PROGRAM") or ""
local text_terminals = term:find("alacritty") or term:find("xfce") or term:find("linux") or
    term:find("terminator")

if text_terminals then
  -- Define a complete set of text-based icons for nvim-tree
  local text_icons = {
    default = "F",
    symlink = "L",
    folder = {
      arrow_closed = ">", -- when folder is closed
      arrow_open   = "v", -- when folder is open
      default      = "[+]",
      open         = "[-]",
      empty        = "[+]",
      empty_open   = "[-]",
      symlink      = "[L]",
      symlink_open = "[L]",
    },
    git = {
      unstaged  = "!",
      staged    = "+",
      unmerged  = "U",
      renamed   = "R",
      untracked = "?",
      deleted   = "D",
      ignored   = "I",
    },
  }

  -- Set custom file icons for text terminals using nvim-web-devicons.
  -- Here you map file extensions (e.g. "rs" for Rust) to your desired icons.

  require("nvim-web-devicons").set_icon({
    rs = {
      icon = "🦀",
      color = "#dea584",
      name = "Rust",
    },
    lua = {
      icon = "λ",
      color = "#51a0cf",
      name = "Lua",
    },
    py = {
      icon = "🐍",
      color = "#3572A5",
      name = "Python",
    },
    cpp = {
      icon = "C++",
      color = "#f34b7d",
      name = "Cpp",
    },
    c = {
      icon = "C",
      color = "#555555",
      name = "C",
    },
    txt = {
      icon = "TXT",
      color = "#89e051",
      name = "Text",
    },
    html = {
      icon = "HTML",
      color = "#e34c26",
      name = "HTML",
    },
    css = {
      icon = "CSS",
      color = "#563d7c",
      name = "CSS",
    },
    js = {
      icon = "JS",
      color = "#f1e05a",
      name = "JavaScript",
    },
    ts = {
      icon = "TS",
      color = "#3178c6",
      name = "TypeScript",
    },
    json = {
      icon = "JSON",
      color = "#cbcb41",
      name = "JSON",
    },
    md = {
      icon = "MD",
      color = "#519aba",
      name = "Markdown",
    },
    sh = {
      icon = "SH",
      color = "#89e051",
      name = "Shell",
    },
    rb = {
      icon = "RB",
      color = "#701516",
      name = "Ruby",
    },
    java = {
      icon = "JAVA",
      color = "#b07219",
      name = "Java",
    },
    go = {
      icon = "GO",
      color = "#00ADD8",
      name = "Go",
    },
    php = {
      icon = "🐘",
      color = "#4F5D95",
      name = "PHP",
    },
    scss = {
      icon = "SCSS",
      color = "#c6538c",
      name = "SCSS",
    },
    less = {
      icon = "LESS",
      color = "#1d365d",
      name = "Less",
    },
    svg = {
      icon = "SVG",
      color = "#ffb13b",
      name = "SVG",
    },
    xml = {
      icon = "XML",
      color = "#e34c26",
      name = "XML",
    },
    yml = {
      icon = "YAML",
      color = "#cb171e",
      name = "YAML",
    },
    yaml = {
      icon = "YAML",
      color = "#cb171e",
      name = "YAML",
    },
    ini = {
      icon = "INI",
      color = "#d1d1d1",
      name = "INI",
    },
    dockerfile = {
      icon = "🐳",
      color = "#384d54",
      name = "Dockerfile",
    },
    makefile = {
      icon = "MAKE",
      color = "#89e051",
      name = "Makefile",
    },
    toml = {
      icon = "TOML",
      color = "#d75f5f",
      name = "TOML",
    },
    lock = {
      icon = "LOCK",
      color = "#cbcb41",
      name = "Lock",
    },
    zip = {
      icon = "ZIP",
      color = "#d0a1e6",
      name = "Zip",
    },
    rar = {
      icon = "RAR",
      color = "#d0a1e6",
      name = "Rar",
    },
    tar = {
      icon = "TAR",
      color = "#d0a1e6",
      name = "Tar",
    },
    gz = {
      icon = "GZ",
      color = "#d0a1e6",
      name = "GZ",
    },
    epub = {
      icon = "EPUB",
      color = "#a8a8a8",
      name = "EPUB",
    },
    pdf = {
      icon = "PDF",
      color = "#b30b00",
      name = "PDF",
    },
    doc = {
      icon = "DOC",
      color = "#2a5699",
      name = "DOC",
    },
    docx = {
      icon = "DOCX",
      color = "#2a5699",
      name = "DOCX",
    },
    ppt = {
      icon = "PPT",
      color = "#d24726",
      name = "PPT",
    },
    pptx = {
      icon = "PPTX",
      color = "#d24726",
      name = "PPTX",
    },
    xls = {
      icon = "XLS",
      color = "#207245",
      name = "XLS",
    },
    xlsx = {
      icon = "XLSX",
      color = "#207245",
      name = "XLSX",
    },
    csv = {
      icon = "CSV",
      color = "#89e051",
      name = "CSV",
    },
    log = {
      icon = "LOG",
      color = "#d0a1e6",
      name = "Log",
    },
    bat = {
      icon = "BAT",
      color = "#C1F12E",
      name = "Batch",
    },
    coffee = {
      icon = "☕",
      color = "#6f4e37",
      name = "CoffeeScript",
    },
    vim = {
      icon = "VIM",
      color = "#019833",
      name = "Vim",
    },
    pl = {
      icon = "PERL",
      color = "#0298c3",
      name = "Perl",
    },
    swift = {
      icon = "SWIFT",
      color = "#F05138",
      name = "Swift",
    },
    kt = {
      icon = "KT",
      color = "#F88A02",
      name = "Kotlin",
    },
    hs = {
      icon = "HASK",
      color = "#5e5086",
      name = "Haskell",
    },
    erl = {
      icon = "ERL",
      color = "#B83998",
      name = "Erlang",
    },
    ex = {
      icon = "ELIX",
      color = "#6e4a7e",
      name = "Elixir",
    },
    exs = {
      icon = "ELIX",
      color = "#6e4a7e",
      name = "ElixirScript",
    },
    dart = {
      icon = "DART",
      color = "#00B4AB",
      name = "Dart",
    },
    r = {
      icon = "R",
      color = "#198CE7",
      name = "R",
    },
    sql = {
      icon = "SQL",
      color = "#e37933",
      name = "SQL",
    },
    vue = {
      icon = "VUE",
      color = "#42b883",
      name = "Vue",
    },
    svelte = {
      icon = "SVELTE",
      color = "#ff3e00",
      name = "Svelte",
    },
    nim = {
      icon = "NIM",
      color = "#37775b",
      name = "Nim",
    },
    ps1 = {
      icon = "PS1",
      color = "#012456",
      name = "PowerShell",
    },
    tex = {
      icon = "TEX",
      color = "#3D6117",
      name = "TeX",
    },
    bib = {
      icon = "BIB",
      color = "#FF79C6",
      name = "BibTeX",
    },
    odt = {
      icon = "ODT",
      color = "#2B579A",
      name = "ODT",
    },
    ods = {
      icon = "ODS",
      color = "#107C10",
      name = "ODS",
    },
    odp = {
      icon = "ODP",
      color = "#C0504D",
      name = "ODP",
    },
    mp3 = {
      icon = "MP3",
      color = "#FF4081",
      name = "MP3",
    },
    wav = {
      icon = "WAV",
      color = "#FF7043",
      name = "WAV",
    },
    flac = {
      icon = "FLAC",
      color = "#00BCD4",
      name = "FLAC",
    },
    mp4 = {
      icon = "MP4",
      color = "#4CAF50",
      name = "MP4",
    },
    mkv = {
      icon = "MKV",
      color = "#F44336",
      name = "MKV",
    },
    avi = {
      icon = "AVI",
      color = "#3F51B5",
      name = "AVI",
    },
    mov = {
      icon = "MOV",
      color = "#9C27B0",
      name = "MOV",
    },
    exe = {
      icon = "EXE",
      color = "#FF9800",
      name = "EXE",
    },
    iso = {
      icon = "ISO",
      color = "#795548",
      name = "ISO",
    },
    dmg = {
      icon = "DMG",
      color = "#607D8B",
      name = "DMG",
    },
  })


  require("nvim-tree").setup({
    renderer = {
      icons = {
        glyphs = text_icons, -- Use our text-based glyphs for folders, git, etc.
      },
    },
    disable_netrw = true,
    hijack_netrw = true,
    diagnostics = { enable = true },
    view = {
      side = "left",
      width = 35,
      number = false,
      relativenumber = true,
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    git = { enable = true },
    filters = {
      dotfiles = false,
      custom = { ".git", "node_modules", "__pycache__" },
    },
  })

  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      local api = require("nvim-tree.api")
      if vim.fn.argc() == 0 then
        api.tree.open()
      end
    end,
  })
else
  -- For graphical terminals (or if you prefer the devicons look), use the default (graphical) icon settings.
  require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    diagnostics = { enable = true },
    view = {
      side = "left",
      width = 35,
      number = false,
      relativenumber = true,
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    git = { enable = true },
    filters = {
      dotfiles = false,
      custom = { ".git", "node_modules", "__pycache__" },
    },
  })
end

-- Auto-open NvimTree when opening a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local api = require("nvim-tree.api")
    if vim.fn.argc() == 0 then
      api.tree.open()
    end
  end,
})
