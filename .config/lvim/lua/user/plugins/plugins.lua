lvim.plugins = {
    { "ThePrimeagen/harpoon" },
    { "b0o/incline.nvim" },
    { "folke/trouble.nvim", cmd = "TroubleToggle" },
    { "folke/zen-mode.nvim" },
    { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" },
    { "uga-rosa/ccc.nvim" },
    { "kazhala/close-buffers.nvim" },
    {
        "anuvyklack/pretty-fold.nvim",
        requires = { { "anuvyklack/fold-preview.nvim" }, { "anuvyklack/keymap-amend.nvim" } },
    },
    {
        "kylechui/nvim-surround",
        tag = "*",
    },
    {
        "windwp/nvim-ts-autotag",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
    },
    {
        "nvim-treesitter/playground",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
        run = ":TSInstall query",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
    },
    {
        "s1n7ax/nvim-window-picker",
        tag = "v1.*",
    },
    {
        "nmac427/guess-indent.nvim",
    },
    {
        "ibhagwan/fzf-lua",
        requires = { "kyazdani42/nvim-web-devicons" },
    },
    {
        "dnlhc/glance.nvim",
    },
    { "~/Documents/dev/repos/personal/terra-theme/nvim" },
    { "chentoast/marks.nvim" },
    -- { "terra-theme/nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "ThePrimeagen/vim-be-good" },
    { "mbbill/undotree" },
    {
        "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
            ---@diagnostic disable-next-line: param-type-mismatch
            vim.defer_fn(function()
                -- FIX: These setup settings do not get respected
                require("copilot").setup({
                    plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
                    cmp = {
                        enabled = true,
                        method = "getCompletionsCycling",
                    },
                    panel = {
                        enabled = false,
                        auto_refresh = false,
                        keymap = {
                            jump_prev = "[[",
                            jump_next = "]]",
                            accept = "<CR>",
                            refresh = "gr",
                            open = "<M-y>",
                        },
                    },
                    suggestion = {
                        enabled = true,
                        auto_trigger = true,
                        debounce = 75,
                        keymap = {
                            accept = "<C-f>",
                            next = "<M-]>",
                            prev = "<M-[>",
                            dismiss = "<C-]>",
                        },
                    },
                    filetypes = {
                        yaml = false,
                        markdown = false,
                        help = false,
                        gitcommit = false,
                        gitrebase = false,
                        hgcommit = false,
                        svn = false,
                        cvs = false,
                        ["."] = false,
                    },
                    copilot_node_command = "node", -- Node.js version must be > 16.x
                    server_opts_overrides = {},
                })
                ---@diagnostic disable-next-line: param-type-mismatch
            end, 200)
        end,
    },
    -- {
    --     -- FIX: This doesn't work. :CmpStatus shows this as unknown source and the suggestions do not appear
    --     "zbirenbaum/copilot-cmp",
    --     after = { "copilot.lua" },
    --     config = function()
    --         require("copilot_cmp").setup()
    --     end,
    -- },
}

-- Can not be placed into the config method of the plugins.
-- lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
