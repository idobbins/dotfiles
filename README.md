# dotfiles

A small, portable Neovim configuration for local machines and SSH hosts. It is
plain Lua, uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugins, and
defaults to Ayu Light.

## Install

Requirements:

- Neovim 0.11.7 or newer
- Git
- A C compiler for Tree-sitter parsers
- `curl`, `unzip`, `tar`, and `gzip` for portable tool installation
- Node.js for the TypeScript and Python servers (an FNM default is detected)

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
`:Mason` shows installed language tooling.

## Language servers

Mason installs these servers automatically in Neovim's data directory:

| Language | nvim-lspconfig name | Mason package |
| --- | --- | --- |
| Bash | `bashls` | `bash-language-server` |
| Lua | `lua_ls` | `lua-language-server` |
| TypeScript/JavaScript | `ts_ls` | `typescript-language-server` |
| Python | `pyright` | `pyright` |
| Rust | `rust_analyzer` | `rust-analyzer` |

The config exposes FNM's default Node runtime to Neovim even when it starts
outside an interactive shell. Use `:checkhealth mason` to inspect installation
dependencies and `:checkhealth vim.lsp` to inspect attached servers.
Nix files retain Tree-sitter highlighting, but no Nix toolchain or language
server is installed.

## Finding files and text

[FFF](https://github.com/dmtrKovalenko/fff) handles file and content search with
a persistent, frecency-aware index. Neovim's built-in `:buffer` and `:help`
completion handle the less common buffer and documentation paths, avoiding a
second picker plugin. In FFF live grep, `Shift-Tab` cycles plain, regex, and
fuzzy modes; `git:modified` narrows results to changed files.

## Keymaps

The leader key is Space.

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fw` | Search word under cursor or visual selection |
| `<leader>fb` | List buffers, then prompt for one |
| `<leader>fh` | Prompt for a help topic |
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
