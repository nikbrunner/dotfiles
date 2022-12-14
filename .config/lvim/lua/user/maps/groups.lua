local cmd = require("user.cmd")
local gitsigns = require("gitsigns")
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
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    d = {
        "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<CR>",
        "Buffer Diagnostics",
    },
    w = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
    f = { require("lvim.lsp.utils").format, "Format" },
    i = { "<cmd>LspInfo<CR>", "Info" },
    I = { "<cmd>Mason<CR>", "Mason Info" },
    t = { "<cmd>Trouble document_diagnostics<CR>", "Troubles in Document" },
    T = { "<cmd>Trouble workspace_diagnostics<CR>", "Troubles in Workspace" },
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
    s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
    S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
        "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<CR>", "Telescope Quickfix" },
}

M.search = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
    c = { "<cmd>Telescope commands<CR>", "Commands" },
    C = {
        "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<CR>",
        "Colorscheme with Preview",
    },
    r = { cmd.telescope.find_related_files, "Related files" },
    f = { cmd.telescope.find_files_with_preview, "Find File" },
    w = { cmd.telescope.find_word, "Find File" },
    t = { cmd.telescope.find_text, "Text" },
    M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
    m = { "<cmd>Telescope marks<CR>", "Marks" },
    h = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
    a = {
        name = "Advanced",
        t = { "<cmd>Telescope help_tags<CR>", "Find Help" },
        h = { "<cmd>Telescope highlights<CR>", "Find highlight groups" },
        r = { "<cmd>Telescope registers<CR>", "Registers" },
        k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
    },
}

M.git = {
    name = "Git",
    k = {
        function()
            gitsigns.prev_hunk({ navigation_message = false })
        end,
        "  Prev Hunk",
    },
    j = {
        function()
            gitsigns.next_hunk({ navigation_message = false })
        end,
        "  Next Hunk",
    },
    s = {
        function()
            require("lvim.core.terminal").lazygit_toggle()
        end,
        "Lazygit",
    },
    -- o = { cmd.telescope.find_changed_files, "Open changed file" },
    o = { cmd.fzflua.find_modified_files_with_preview, "Open changed file" },
    C = {
        "<cmd>Telescope git_bcommits<cr>",
        "Checkout commit(for current file)",
    },
    d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Git Diff",
    },
    c = {
        name = "  Checkout",
        b = { "<cmd>Telescope git_branches<CR>", "Branch" },
        c = { cmd.telescope.find_commits, "Commit" },
    },
    b = {
        name = "﬘  Buffer",
        s = { gitsigns.stage_buffer, "  Stage Buffer" },
        r = { gitsigns.reset_buffer, "  Reset Buffer" },
    },
    h = {
        name = "  Hunk",
        k = { gitsigns.prev_hunk, "  Prev Hunk" },
        j = { gitsigns.next_hunk, "  Next Hunk" },
        s = { gitsigns.stage_hunk, "  Stage Hunk" },
        u = { gitsigns.undo_stage_hunk, "  Undo Stage Hunk" },
        p = { gitsigns.preview_hunk, "  Preview Hunk" },
        r = { gitsigns.reset_hunk, "  Reset Hunk" },
        l = { gitsigns.blame_line, "  Blame Line" },
    },
}

M.quit = {
    name = "Quit",
    s = { ":silent wq<CR>", "Save and Quit Pane (:wq)" },
    p = { ":silent BufferLinePickClose<CR>", "Pick Buffer" },
    c = { cmd.quit.custom_buffers, "Custom Filter" },
    q = { ":q<CR>", "Current" },
    o = { cmd.quit.other_buffers, "Other" },
    h = { cmd.quit.hidden_buffers, "Hidden" },
    a = { cmd.quit.all_buffers, "All" },
}

M.marks = {
    name = "Marks",
    a = { mark.add_file, "  Add File" },
    m = { ui.toggle_quick_menu, "  Menu" },
    s = { "<cmd>Telescope marks<CR>", "  Search" },
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

M.terra = {
    name = "Terra",
    s = {
        "<cmd>lua require('terra.actions.config').select_season()<CR>",
        " Select Season",
    },
    t = {
        "<cmd>lua require('terra.actions.config').select_time()<CR>",
        "  Select Time",
    },
    c = {
        "<cmd>lua vim.pretty_print(vim.g.terra_config)<CR>",
        "  Print Terra Config",
    },
}

M.copy = {
    name = "Copy",
    f = { cmd.copy.fullPath, "Full Path" },
    r = { cmd.copy.relativePath, "Relative Path" },
    n = { cmd.copy.fileName, "File Name" },
}

M.buffers = {
    name = "Buffers",
    p = { "<cmd>BufferLinePick<CR>", "Pick" },
    o = { "<cmd>Telescope buffers<CR>", "Open" },
    h = { "<cmd>BufferLineCyclePrev<CR>", "< Previous" },
    l = { "<cmd>BufferLineCycleNext<CR>", "Next >" },
    c = {
        name = "Close",
        h = { "<cmd>BufferLineCloseLeft<CR>", "Close all to the left" },
        l = { "<cmd>BufferLineCloseRight<CR>", "Close all to the right" },
        p = { "<cmd>BufferLinePickClose<CR>", "Pick which buffer to close" },
    },
    s = {
        name = "Sort",
        d = { "<cmd>BufferLineSortByDirectory<CR>", "Sort by directory" },
        l = { "<cmd>BufferLineSortByExtension<CR>", "Sort by language" },
    },
}

return M
