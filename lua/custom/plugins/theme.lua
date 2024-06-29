return {
  'navarasu/onedark.nvim',
  priority = 1000,
  config = true,
  opts = {
    style = 'deep',
    transparent = true,
    colors = {
      fg = "#c3cee3",
      grey = "#6c7891",
      light_grey = "#96a1b5",
    },
    code_style = {
      comments = 'italic',
      keywords = 'italic',
      functions = 'italic',
      strings = 'none',
      variables = 'none',
    },
  },
}
