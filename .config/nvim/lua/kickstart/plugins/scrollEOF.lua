-- scrollEOF.nvim
-- https://github.com/Aasim-A/scrollEOF.nvim
--
-- Makes 'scrolloff' keep working at the end of the file, so the cursor line
-- stays away from the bottom edge of the window instead of hitting it.

return {
  'Aasim-A/scrollEOF.nvim',
  event = { 'CursorMoved', 'WinScrolled' },
  opts = {},
}
