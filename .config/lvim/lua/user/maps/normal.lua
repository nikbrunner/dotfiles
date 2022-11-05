local groups = require("user.maps.groups")

lvim.keys.normal_mode["<CR>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = "$"
lvim.keys.normal_mode["<S-h>"] = "^"
lvim.keys.normal_mode["vv"] = ":norm ^v$<CR>"

lvim.keys.normal_mode["<M-h>"] = ":bprevious<CR>"
lvim.keys.normal_mode["<M-l>"] = ":bnext<CR>"

lvim.lsp.buffer_mappings.normal_mode["gr"] = {
    "<cmd>Trouble lsp_references<cr>",
    "Go to Definiton",
}

-- Function Keys
lvim.keys.normal_mode["<F9>"] = ":TroubleToggle<CR>"

-- With Leader
lvim.leader = "space"

-- Disable
lvim.builtin.which_key.mappings["w"] = {}

-- Whichkey Singles
lvim.builtin.which_key.mappings["n"] = { ":nohl<CR>", WhichKeyIgnoreLabel }
lvim.builtin.which_key.mappings["z"] = { ":ZenMode<CR>", "Zen" }
lvim.builtin.which_key.mappings["/"] = {
    "<cmd>Telescope current_buffer_fuzzy_find theme=get_ivy<CR>",
    "Find Text in File",
}

-- WhichKey Groups
lvim.builtin.which_key.mappings.t = groups.tabs
lvim.builtin.which_key.mappings.l = groups.lsp
lvim.builtin.which_key.mappings.m = groups.marks

-- Tabs
lvim.builtin.which_key.mappings["1"] = { "1gt", WhichKeyIgnoreLabel }
lvim.builtin.which_key.mappings["2"] = { "2gt", WhichKeyIgnoreLabel }
lvim.builtin.which_key.mappings["3"] = { "3gt", WhichKeyIgnoreLabel }
lvim.builtin.which_key.mappings["4"] = { "4gt", WhichKeyIgnoreLabel }
lvim.builtin.which_key.mappings["5"] = { "5gt", WhichKeyIgnoreLabel }
lvim.builtin.which_key.mappings["6"] = { "6gt", WhichKeyIgnoreLabel }
lvim.builtin.which_key.mappings["7"] = { "7gt", WhichKeyIgnoreLabel }
lvim.builtin.which_key.mappings["8"] = { "8gt", WhichKeyIgnoreLabel }
lvim.builtin.which_key.mappings["9"] = { "9gt", WhichKeyIgnoreLabel }
