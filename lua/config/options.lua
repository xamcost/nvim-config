-- Options are automatically loaded before lazy.nvim startup

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

local opt = vim.opt

-- Sync with system clipboard
opt.clipboard = "unnamedplus"

-- Enable mouse mode
opt.mouse = "a"

-- Confirm to save changes before exiting modified buffer
opt.confirm = true

-- Print line number
opt.number = true
opt.relativenumber = true -- Relative line numbers

-- Indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2   -- Size of an indent
opt.tabstop = 2      -- Number of spaces tabs count for

-- Improve search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Enable undo
opt.undofile = true
opt.undolevels = 10000

-- Open vertical windows on the right
opt.splitright = true
