-- gitsigns.nvim
-- https://github.com/lewis6991/gitsigns.nvim
--
-- Shows git change markers in the sign column (+ added, ~ changed, _ deleted)
-- and provides utilities for staging, resetting and previewing hunks.
--
-- NOTE: lua/kickstart/plugins/gitsigns.lua extends this with recommended keymaps.

---@module 'lazy'
---@type LazySpec
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  ---@module 'gitsigns'
  ---@type Gitsigns.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    signs = {
      add = { text = '+' }, ---@diagnostic disable-line: missing-fields
      change = { text = '~' }, ---@diagnostic disable-line: missing-fields
      delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
      topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
      changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
    },
  },
}
