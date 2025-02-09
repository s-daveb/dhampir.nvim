if vim.g.colors_name then
  vim.cmd("hi clear")
end

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "dracula_pro_alucard"

local colors = {
  foreground    = "#1F1F1F",
  red           = "#CB3A2A",
  orange        = "#A34D14",
  yellow        = "#836E15",
  green         = "#14720A",
  cyan          = "#036A96",
  blue          = "#285077",
  pink          = "#A3134D",
  purple        = "#644AC9",
  background    = "#F5F5F5",
  selection     = "#CFCFDE",
  comment       = "#635D97",
  line_highlight = "#DCDEEF", -- Light gray for contrast
  mid_gray      = "#4A4A4A",  -- Mid-gray background alternative
  off_white     = "#F0F0F0",  -- Off-white text alternative
}

local highlights = {
  -- Editor UI
  Normal        = { fg = colors.foreground, bg = colors.background },
  NormalNC      = { fg = colors.foreground, bg = colors.background },
  Comment       = { fg = colors.comment, italic = true },
  CursorLine    = { bg = colors.line_highlight },
  CursorLineNr  = { fg = colors.purple, bg = colors.line_highlight, bold = true },
  LineNr        = { fg = colors.comment, bg = colors.background },
  SignColumn    = { bg = colors.background },
  StatusLine    = { fg = colors.foreground, bg = colors.selection },
  StatusLineNC  = { fg = colors.comment, bg = colors.background },
  VertSplit     = { fg = colors.selection, bg = colors.selection },
  Pmenu         = { fg = colors.foreground, bg = colors.selection },
  PmenuSel      = { fg = colors.background, bg = colors.purple },
  Visual        = { bg = colors.selection },
  Search        = { fg = colors.background, bg = colors.yellow },
  IncSearch     = { fg = colors.background, bg = colors.orange },

  -- Syntax Highlighting
  String        = { fg = colors.yellow },
  Constant      = { fg = colors.purple },
  Number        = { fg = colors.purple },
  Keyword       = { fg = colors.pink },
  Function      = { fg = colors.green },
  Identifier    = { fg = colors.orange },
  Type          = { fg = colors.cyan },
  Statement     = { fg = colors.pink },
  PreProc       = { fg = colors.pink },
  Special       = { fg = colors.blue },
  Error         = { fg = colors.red, bold = true },
  Todo          = { fg = colors.foreground, bg = colors.yellow, bold = true },

  -- Treesitter support
  ["@function"]         = { fg = colors.green },
  ["@method"]           = { fg = colors.green },
  ["@keyword"]          = { fg = colors.pink },
  ["@type"]             = { fg = colors.cyan },
  ["@variable"]         = { fg = colors.orange },
  ["@parameter"]        = { fg = colors.orange },
  ["@comment"]          = { fg = colors.comment, italic = true },
  ["@string"]           = { fg = colors.yellow },
  ["@number"]           = { fg = colors.purple },
  ["@constant"]         = { fg = colors.purple },
  ["@operator"]         = { fg = colors.pink },
  ["@punctuation"]      = { fg = colors.foreground },
  ["@tag"]              = { fg = colors.pink },
  ["@tag.attribute"]    = { fg = colors.green },
  ["@text.title"]       = { fg = colors.purple, bold = true },
  ["@text.strong"]      = { fg = colors.foreground, bold = true },
  ["@text.emphasis"]    = { fg = colors.foreground, italic = true },
  ["@text.underline"]   = { fg = colors.foreground, underline = true },

  -- Diff
  DiffAdd       = { fg = colors.green, bg = "#E6FFED" },
  DiffChange    = { fg = colors.yellow, bg = "#FFF5B1" },
  DiffDelete    = { fg = colors.red, bg = "#FFDCE0" },
  DiffText      = { fg = colors.blue, bg = "#D1ECFF", bold = true },

  -- Diagnostics
  DiagnosticError = { fg = colors.red },
  DiagnosticWarn  = { fg = colors.orange },
  DiagnosticInfo  = { fg = colors.blue },
  DiagnosticHint  = { fg = colors.cyan },
  DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
  DiagnosticUnderlineWarn  = { undercurl = true, sp = colors.orange },
  DiagnosticUnderlineInfo  = { undercurl = true, sp = colors.blue },
  DiagnosticUnderlineHint  = { undercurl = true, sp = colors.cyan },

  -- Git Signs
  GitGutterAdd    = { fg = colors.green },
  GitGutterChange = { fg = colors.yellow },
  GitGutterDelete = { fg = colors.red },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, {
    fg        = opts.fg or "NONE",
    bg        = opts.bg or "NONE",
    bold      = opts.bold,
    italic    = opts.italic,
    underline = opts.underline,
    undercurl = opts.undercurl,
    sp        = opts.sp,
  })
end
