-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.jolorscheme = "github"

-- This is how to create a submenu
-- lvim.builtin.which_key.mappings["f"] = {
--   name = "Find",
--   f = { "<cmd>Telescope find_files<CR>", "File" },
--   g = { "<cmd>Telescope git_status<CR>", "Git Status" },
-- }

-- Add Telescope git_status to git submenu
lvim.builtin.which_key.mappings["gm"] = {
  "<cmd>Telescope git_status<CR>", "Modified Files",
}

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""

-- Go to the beginning and end of a line with H and L
lvim.keys.normal_mode["<S-h>"] = "^"
lvim.keys.normal_mode["<S-l>"] = "$"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferPrevious<CR>"
lvim.keys.normal_mode["<Tab>"] = ":BufferNext<CR>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.auto_open = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = { 
  'javascript', 
  'typescript',
  'html',
  'css',
  'scss',
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- formaters
lvim.lang.css.formatters = { { exe = "prettier" } }
-- TODO Scss/Sass

lvim.lang.typescript.formatters = { { exe = "prettier" } }
lvim.lang.typescriptreact.formatters = lvim.lang.typescript.formatters

lvim.lang.javascript.formatters = { { exe = "prettier" } }
lvim.lang.javascriptreact.formatters = lvim.lang.typescript.formatters

-- Additional Plugins
lvim.plugins = {
  { 
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup({
        themeStyle = "dark",
        transparent = true,
        commentStyle = "italic",
        darkSidebar = false,
        darkFloat = false,
        hideEndOfBuffer = true
      })
    end,
  }
}
