local function set_theme()
    local current_theme = vim.g.colors_name or ""

    if not (current_theme:match("^dracula") or current_theme:match("^dhampir")) then
        return
    end
    if vim.o.background == "dark" then
        vim.cmd("colorscheme dracula") -- Use regular Dracula for dark mode
    else
        vim.g.colors_name = "dhampir"
        if vim.fn.exists("syntax_on") == 1 then
            vim.cmd("syntax reset")
        end
        vim.cmd("hi clear")

        local colors = {
            foreground    = "#202021",
            red           = "#CC3B2C",
            orange        = "#A34F15",
            yellow        = "#837116",
            green         = "#14730C",
            cyan          = "#036B98",
            blue          = "#285278",
            pink          = "#A3144F",
            purple        = "#654BCA",
            background    = "#F6F6F6",
            selection     = "#D0D0DF",
            comment       = "#645E98",
            line_highlight = "#DDDFEF",
            mid_gray      = "#4B4B4B",
            off_white     = "#F1F1F1",
        }

        local highlights = {
            Normal        = { fg = colors.foreground, bg = colors.background },
            Comment       = { fg = colors.comment, italic = true },
            CursorLine    = { bg = colors.line_highlight },
            CursorLineNr  = { fg = colors.purple, bg = colors.line_highlight, bold = true },
            ColorColumn   = { fg = colors.line_highlight },
            LineNr        = { fg = colors.comment, bg = colors.background },
            Pmenu         = { fg = colors.foreground, bg = colors.selection },
            PmenuSel      = { fg = colors.background, bg = colors.purple },
            Visual        = { bg = colors.selection },
            Search        = { fg = colors.background, bg = colors.yellow },
            IncSearch     = { fg = colors.background, bg = colors.orange },
            String        = { fg = colors.yellow },
            Function      = { fg = colors.green },
            Keyword       = { fg = colors.pink },
            Type          = { fg = colors.cyan },
            Error         = { fg = colors.red, bold = true },
            DiagnosticError = { fg = colors.red },
            DiagnosticWarn  = { fg = colors.orange },
            DiagnosticInfo  = { fg = colors.blue },
            DiagnosticHint  = { fg = colors.cyan },
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
    end
end

-- Run theme setup
set_theme()

-- Auto-switch theme when background setting changes
vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "background",
    callback = set_theme,
})
