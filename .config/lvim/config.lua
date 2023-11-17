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

  source /android0/llvm-project/llvm/utils/vim/ftplugin/llvm.vim
  source /android0/llvm-project/llvm/utils/vim/syntax/llvm.vim
  " source /android0/llvm-project/llvm/utils/vim/syntax/machine-ir.vim
  source /android0/llvm-project/llvm/utils/vim/syntax/mir.vim
  source /android0/llvm-project/llvm/utils/vim/syntax/tablegen.vim
  au BufNewFile,BufRead *.ll setf llvm
  au BufNewFile,BufRead *.td setf tablegen
  au BufNewFile,BufRead *.mir setf mir
]]

-- expand tabs to 8 spaces
vim.opt.tabstop = 8

-- use `cc` to comment out lines or blocks
vim.keymap.set({ "n" }, "cc", "gcc", { remap = true })
vim.keymap.set({ "v" }, "cc", "gc", { remap = true })

-- set soft wrapping. Wrap lines rather than flow them off the screen.
vim.opt.wrap = true

-- hotkey `@o` to insert `dbgs() << __func__ << '\n';` on the line above cursor.
vim.fn.setreg('o', "Ollvm::dbgs() << __func__ << \"\\n\";")

-- set spell on commit messages, .txt files, and email.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit,text,mail,rst"},
  callback = function()
    vim.opt.spell = true
  end
})

-- stop luavim from eating mouse hightlight copy to clipboard.
vim.opt.mouse = ""

-- <leader>la to apply fixits
