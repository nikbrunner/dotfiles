local present, zen = pcall(require, "zen-mode")
if not present then
    return
end
-- https://github.com/folke/zen-mode.nvim
zen.setup({
    window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        width = 120, -- width of the Zen window
    },
    plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
            enabled = true,
            ruler = false, -- disables the ruler text in the cmd line area
            showcmd = false, -- disables the command in the last line of the screen
        },
        gitsigns = { enabled = true }, -- disables git signs
        -- this will change the font size on kitty when in zen mode
        -- to make this work, you need to set the following kitty options:
        -- - allow_remote_control socket-only
        -- - listen_on unix:/tmp/kitty
        kitty = {
            enabled = true,
            font = "+4", -- font size increment
        },
    },
})
