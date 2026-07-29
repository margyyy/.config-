vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.keymap.set({ "n", "i", "v", "x" }, "<C-s>", "<cmd>write<cr>") --save the file

vim.cmd("syntax enable")

local palette = {
  bg = "#101010",
  bg_alt = "#181818",
  bg_soft = "#202020",
  fg = "#c8c8c8",
  fg_dim = "#888888",
  fg_bright = "#eeeeee",
  grey = "#505050",
  red = "#c47c7c",
  green = "#9aae7b",
  yellow = "#c8ad6e",
  blue = "#7f95bd",
  magenta = "#b08ab6",
  cyan = "#82a8a8",
  orange = "#d09a6a",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hl("Normal", { fg = palette.fg, bg = palette.bg })
hl("NormalFloat", { fg = palette.fg, bg = palette.bg_alt })
hl("FloatBorder", { fg = palette.grey, bg = palette.bg_alt })
hl("Cursor", { fg = palette.bg, bg = palette.fg_bright })
hl("CursorLine", { bg = palette.bg_alt })
hl("Visual", { bg = "#4a4a4a" })
hl("LineNr", { fg = palette.grey, bg = palette.bg })
hl("CursorLineNr", { fg = palette.fg_bright, bg = palette.bg, bold = true })
hl("SignColumn", { fg = palette.grey, bg = palette.bg })
hl("StatusLine", { fg = palette.fg, bg = palette.bg_soft })
hl("StatusLineNC", { fg = palette.fg_dim, bg = palette.bg_alt })
hl("Pmenu", { fg = palette.fg, bg = palette.bg_alt })
hl("PmenuSel", { fg = palette.fg_bright, bg = "#30303c" })
hl("Search", { fg = palette.bg, bg = palette.yellow })
hl("IncSearch", { fg = palette.bg, bg = palette.orange })

hl("Comment", { fg = palette.magenta, italic = true })
hl("Constant", { fg = palette.yellow })
hl("String", { fg = palette.red })
hl("Character", { fg = palette.red })
hl("Number", { fg = palette.yellow })
hl("Boolean", { fg = palette.yellow })
hl("Float", { fg = palette.yellow })
hl("Identifier", { fg = palette.fg })
hl("Function", { fg = palette.green })
hl("Statement", { fg = palette.blue })
hl("Conditional", { fg = palette.blue })
hl("Repeat", { fg = palette.blue })
hl("Label", { fg = palette.blue })
hl("Operator", { fg = palette.fg })
hl("Keyword", { fg = palette.magenta })
hl("Exception", { fg = palette.red })
hl("PreProc", { fg = palette.magenta })
hl("Include", { fg = palette.magenta })
hl("Define", { fg = palette.magenta })
hl("Macro", { fg = palette.magenta })
hl("Type", { fg = palette.green })
hl("StorageClass", { fg = palette.green })
hl("Structure", { fg = palette.green })
hl("Special", { fg = palette.cyan })
hl("Underlined", { fg = palette.fg_bright, underline = true })
hl("Todo", { fg = palette.bg, bg = palette.yellow, bold = true })
hl("Error", { fg = palette.red, bg = palette.bg })
hl("ErrorMsg", { fg = palette.red, bg = palette.bg })
hl("WarningMsg", { fg = palette.yellow, bg = palette.bg })
hl("Directory", { fg = palette.blue })
hl("NonText", { fg = palette.grey })
hl("SpecialKey", { fg = palette.grey })
hl("MatchParen", { fg = palette.fg_bright, bg = palette.grey, bold = true })

vim.g.terminal_color_0 = palette.bg
vim.g.terminal_color_1 = palette.red
vim.g.terminal_color_2 = palette.green
vim.g.terminal_color_3 = palette.yellow
vim.g.terminal_color_4 = palette.blue
vim.g.terminal_color_5 = palette.magenta
vim.g.terminal_color_6 = palette.cyan
vim.g.terminal_color_7 = palette.fg
vim.g.terminal_color_8 = palette.grey
vim.g.terminal_color_9 = "#d89090"
vim.g.terminal_color_10 = "#b0c58d"
vim.g.terminal_color_11 = "#d9c078"
vim.g.terminal_color_12 = "#96abd2"
vim.g.terminal_color_13 = "#c79bca"
vim.g.terminal_color_14 = "#98c0c0"
vim.g.terminal_color_15 = palette.fg_bright
