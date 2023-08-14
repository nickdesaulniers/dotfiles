-- Plugins
-- (put these first so that syntax errors below don't uninstall them)
lvim.plugins = {
   { "tpope/vim-fugitive" }
}

-- highlight line 80 in red
vim.opt.colorcolumn = '80'
vim.cmd [[
  autocmd ColorScheme * highlight ColorColumn guibg=darkred
  " highlight tabs in yellow
  call matchadd('Tabs', '\t')
  autocmd ColorScheme * highlight Tabs guibg=yellow
  " highlight trailing space in red
  call matchadd('ExtraWhitespace', '\s\+$')
  autocmd ColorScheme * highlight ExtraWhitespace guibg=darkred
]]

-- use `cc` to comment out lines or blocks
vim.keymap.set({ "n" }, "cc", "gcc", { remap = true })
vim.keymap.set({ "v" }, "cc", "gc", { remap = true })
