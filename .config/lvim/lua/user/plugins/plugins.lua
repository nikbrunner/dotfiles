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
}
