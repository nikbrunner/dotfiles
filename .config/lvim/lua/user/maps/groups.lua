local present, _ = pcall(require, "harpoon")
if not present then
    return
end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local M = {}

M.tabs = {
    name = "+Tabs",
    n = { ":tabnew<CR>", "New Tab" },
    h = { ":tabprevious<CR>", "Previous Tab" },
    l = { ":tabnext<CR>", "Next Tab" },
    e = { ":tabmove<CR>", "Move Tab To End" },
    r = {
        function()
            vim.ui.input({
                prompt = "  Enter a Name for the Tab",
            }, function(input)
                if input then
                    vim.cmd("LualineRenameTab " .. input)
                else
                    return
                end
            end)
        end,
        "Rename Tab",
    },
    H = { ":tabmove -1<CR>", "Move Left" },
    L = { ":tabmove +1<CR>", "Move Right" },
    q = { ":tabclose<CR>", "Close Tab" },
    o = { ":tabonly<CR>", "Only Tab" },
    O = { "<C-w>T", "Open in new Tab" },
    ["1"] = { "1gt", "Tab 1" },
    ["2"] = { "2gt", "Tab 2" },
    ["3"] = { "3gt", "Tab 3" },
    ["4"] = { "4gt", "Tab 4" },
    ["5"] = { "5gt", "Tab 5" },
    ["6"] = { "6gt", "Tab 6" },
    ["7"] = { "7gt", "Tab 7" },
    ["8"] = { "8gt", "Tab 8" },
    ["9"] = { "9gt", "Tab 9" },
}

M.lsp = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
        "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
        "Buffer Diagnostics",
    },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    f = { require("lvim.lsp.utils").format, "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    j = {
        vim.diagnostic.goto_next,
        "Next Diagnostic",
    },
    k = {
        vim.diagnostic.goto_prev,
        "Prev Diagnostic",
    },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    q = { vim.diagnostic.setloclist, "Quickfix" },
    n = { vim.lsp.buf.rename, "Rename" },
    r = { ":Trouble lsp_references<CR>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
}

M.search = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    p = {
        "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
        "Colorscheme with Preview",
    },
}

M.marks = {
    name = "Marks",
    a = { mark.add_file, "  Add File" },
    m = { ui.toggle_quick_menu, "  Menu" },
    ["1"] = {
        function()
            ui.nav_file(1)
        end,
        "",
    },
    ["2"] = {
        function()
            ui.nav_file(2)
        end,
        "",
    },
    ["3"] = {
        function()
            ui.nav_file(3)
        end,
        "",
    },
    ["4"] = {
        function()
            ui.nav_file(4)
        end,
        "",
    },
    ["5"] = {
        function()
            ui.nav_file(5)
        end,
        "",
    },
    ["6"] = {
        function()
            ui.nav_file(6)
        end,
        "",
    },
    ["7"] = {
        function()
            ui.nav_file(7)
        end,
        "",
    },
    ["8"] = {
        function()
            ui.nav_file(8)
        end,
        "",
    },
    ["9"] = {
        function()
            ui.nav_file(9)
        end,
        "",
    },
}

return M
