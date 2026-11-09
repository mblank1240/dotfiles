-- gruvbox.nvim
-- https://github.com/ellisonleao/gruvbox.nvim
--
-- Gruvbox colorscheme. This is the active theme, applied on startup.

---@module 'lazy'
---@type LazySpec
return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function() vim.cmd.colorscheme 'gruvbox' end,
}
