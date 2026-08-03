vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- FNM is normally initialized by an interactive shell. Add its default Node
-- runtime here so Node-backed tools also work when Neovim starts from SSH,
-- systemd, or a GUI process.
local fnm_default_bin = vim.fn.expand("~/.local/share/fnm/aliases/default/bin")
if vim.fn.isdirectory(fnm_default_bin) == 1 then
  local path = vim.split(vim.env.PATH or "", ":", { plain = true })
  if not vim.tbl_contains(path, fnm_default_bin) then
    vim.env.PATH = fnm_default_bin .. ":" .. (vim.env.PATH or "")
  end
end

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.smartindent = true
opt.termguicolors = true
opt.background = "light"
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
