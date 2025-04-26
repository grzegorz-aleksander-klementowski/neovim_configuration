# neovim_configuration
It shows my NeoVim setup. Created for Rust development. It includes additional non-convincing configuration for Alacritty terminal, xtem,  TTY.  
It works – you can clone for a ready-to-use setup.
Planned 

---

# 🛠️ My Neovim Configuration

This repository contains my personal Neovim configuration, designed for **clarity**, **efficiency**, and **full-text terminal support**.  
It combines modern Lua-powered plugins with thoughtful customizations for better coding comfort, especially in Rust, C++, and scripting languages. Works well for sure for `NVIM v0.10.4`.

---

## 🌟 Features

- **Structured Core Setup** (`lua/core/`)
  - Options, keymaps, and autocommands are cleanly separated.
- **Plugin Management** (`lua/kierownik-wtyczek.lua`)
  - Powered by [lazy.nvim](https://github.com/folke/lazy.nvim) for efficient plugin loading.
- **Full Plugin Ecosystem** (`lua/plugins/`)
  - **LSP ready** (with servers for Rust, Python, C++, Web development).
  - **Treesitter** for better syntax parsing.
  - **Git integration** with Gitsigns and Diffview.
  - **Autocomplete** using nvim-cmp with snippet support.
  - **Project navigation** via Telescope and project.nvim.
  - **Minimap**, **Statusline**, **File Explorer**, **Comments**, **Signature help**, and more.

- **Visual Customization** (`lua/ui/`)
  - Color scheme tuning, better cursor behavior, vertical indent lines.
  - Diagnostics displayed **with custom background highlights** and **floating windows** for errors.

- **Special Terminal Support**  
  Detects if running in *text-based terminals* like Alacritty or Linux console and adjusts icons and visuals for compatibility.

- **Rust Developer Friendly**
  - Includes Crates.nvim, Rust Analyzer settings, and optional Rustaceanvim support.
  - Small touches like 🦀 icons for `.rs` files when available.

- **Extensible Utilities** (`lua/utils/`)
  - Built-in formatting helpers.
  - Configured autoformatting on save.

---

## 📂 Repository Structure

```text
.
├── diagnostics/          # Diagnostic output logs
├── init.lua               # Main Neovim startup script
├── minimal_init.lua       # Minimal fallback config
├── lua/
│   ├── core/              # Core settings: options, keymaps, autocommands
│   ├── plugins/           # Plugin configurations (grouped per plugin)
│   ├── ui/                # UI tweaks and appearance settings
│   ├── utils/             # Helper functions (e.g., formatters)
│   └── kierownik-wtyczek.lua  # Plugin manager bootstrap (Lazy.nvim)
├── lazy-lock.json         # Plugin version lock (auto-generated)
├── struktura.txt          # Manual structure description
```

---

## 📜 Philosophy

This configuration aims to be:

- **Modular and maintainable** — clear separation between different responsibilities (core, plugins, UI, utils).
- **Terminal-friendly** — designed to work even on minimal text terminals without sacrificing features.
- **Rust-focused**, but language-agnostic enough for Python, C++, Bash, and web technologies.
- **Performance-aware** — lazy-loading plugins and disabling unnecessary runtime costs.
- **Elegant and readable** — custom icons, highlight tweaks, and intuitive diagnostics.

---

## ⚡ Quick Start

If you want to try it, just clone it:

```bash
git clone https://github.com/grzegorz-aleksander-klementowski/neovim_configuration/
```

**Neovim 0.9 or later** is recommended.  
Some plugins (e.g., Rustaceanvim) may require **Neovim 0.11+** for full functionality.

---

## 🚧 Notes

- Some features (like custom project discovery) can be expanded.
- Crates.nvim initialization is optional if the plugin is missing.
- Minimal setup (`minimal_init.lua`) can be used for debugging or faster startup.
