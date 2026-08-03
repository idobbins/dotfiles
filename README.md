# dotfiles

A small, portable Neovim configuration for local machines and SSH hosts. It is
plain Lua, uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugins, and
defaults to Ayu Light.

## Install

Requirements:

- Neovim 0.11.7 or newer
- Git
- A C compiler for Tree-sitter parsers
- `ripgrep` for `<leader>fg` live grep

Clone and link the configuration:

```sh
git clone https://github.com/idobbins/dotfiles.git ~/dotfiles
~/dotfiles/install
```

The installer moves an existing `~/.config/nvim` aside with a timestamp before
creating the symlink, so it is safe to rerun.

On first launch, lazy.nvim installs the plugins. The generated `lazy-lock.json`
is committed so every host can use the same plugin revisions.

## Update

Pull the repository and synchronize plugins in one command:

```sh
~/dotfiles/update
```

Inside Neovim, `:Lazy` opens the plugin UI and `:Lazy sync` updates directly.

## Language servers

The configuration enables these servers when their executables are available:

| Language | nvim-lspconfig name | Expected executable |
| --- | --- | --- |
| Nix | `nil_ls` | `nil` |
| Lua | `lua_ls` | `lua-language-server` |
| TypeScript/JavaScript | `ts_ls` | `typescript-language-server` |
| Python | `pyright` | `pyright-langserver` |
| Rust | `rust_analyzer` | `rust-analyzer` |

Language servers are intentionally installed by the host package manager, not
by Neovim. This keeps the editor config predictable on macOS, NixOS, and small
remote machines. Use `:checkhealth vim.lsp` to see what is available.

## Keymaps

The leader key is Space.

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |
| `gd` | Go to definition |
| `K` | Hover documentation |
| `gr` | Find references |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `[d` / `]d` | Previous / next diagnostic |

## Why lazy.nvim, not Lazygit?

`lazy.nvim` is the Neovim plugin manager and belongs in this config. Lazygit is
a separate terminal Git interface; it is excellent, but optional and best
installed per host. Run it in another terminal pane when you want it—no Neovim
plugin is required.
