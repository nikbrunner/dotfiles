local present, incline = pcall(require, "incline")
if not present then
    return
end

---@diagnostic disable-next-line: unused-function, unused-local
local function get_relative_filename(props)
    local bufname = vim.api.nvim_buf_get_name(props.buf)
    if bufname == "" then
        return "[No name]"
    else
        return vim.fn.fnamemodify(bufname, ":.")
    end
end

local function get_diagnostic_label(props)
    local icons = {
        Error = "",
        Warn = "",
        Info = "",
        Hint = "",
    }

    local label = {}

    for severity, icon in pairs(icons) do
        local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
        if n > 0 then
            table.insert(label, { icon .. " " .. n .. " ", group = "DiagnosticSign" .. severity })
        end
    end

    return label
end

local function get_relative_filename_with_diagnostics(props)
    local bufname = vim.api.nvim_buf_get_name(props.buf)
    local filename = vim.fn.fnamemodify(bufname, ":t")
    local diagnostics = get_diagnostic_label(props)
    local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "None"
    local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)
    local relativeFileName = vim.fn.fnamemodify(bufname, ":.")

    local buffer = {
        { filetype_icon, guifg = color },
        { " " },
        { relativeFileName, gui = modified },
    }

    if #diagnostics > 0 then
        table.insert(diagnostics, { "| ", guifg = "grey" })
    end

    for _, buffer_ in ipairs(buffer) do
        table.insert(diagnostics, buffer_)
    end

    return diagnostics
end

incline.setup({
    render = get_relative_filename_with_diagnostics,
    debounce_threshold = { falling = 500, rising = 250 },
    hide = {
        cursorline = true,
        focused_win = false,
        only_win = false,
    },
    highlight = {
        groups = {
            InclineNormal = {
                default = true,
                group = "NormalFloat",
            },
            InclineNormalNC = {
                default = true,
                group = "NormalFloat",
            },
        },
    },
    ignore = {
        buftypes = "special",
        filetypes = {},
        floating_wins = true,
        unlisted_buffers = true,
        wintypes = "special",
    },
    window = {
        margin = {
            horizontal = 0,
            vertical = 1,
        },
        options = {
            signcolumn = "no",
            wrap = false,
        },
        padding = 1,
        padding_char = " ",
        placement = {
            vertical = "bottom",
            horizontal = "right",
        },
        width = "fit",
        -- width = "fill",
        winhighlight = {
            active = {
                EndOfBuffer = "None",
                Normal = "BufferVisibleMod",
                Search = "None",
            },
            inactive = {
                EndOfBuffer = "None",
                Normal = "BufferInactive",
                Search = "None",
            },
        },
        zindex = 50,
    },
})
