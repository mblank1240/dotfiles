-- todo-comments.nvim
-- https://github.com/folke/todo-comments.nvim
--
-- Highlights TODO, NOTE, FIX, WARN, HACK, PERF etc. in comments so they
-- stand out, and lets you search them (e.g. :TodoTelescope).

---@module 'lazy'
---@type LazySpec
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  ---@module 'todo-comments'
  ---@type TodoOptions
  ---@diagnostic disable-next-line: missing-fields
  opts = { signs = false },
}
