local lib = require("user.lib")

local M = {}

M.log_word = function()
    local current_word = vim.fn.expand("<cword>")
    local current_filename = lib.general.get_current_filename(false)
    local message = '"' .. current_filename .. ":" .. current_word .. '", ' .. current_word

    if
        vim.bo.filetype == "typescript"
        or vim.bo.filetype == "typescriptreact"
        or vim.bo.filetype == "javascript"
        or vim.bo.filetype == "javascriptreact"
    then
        vim.cmd("norm oconsole.log(" .. message .. ");")
    elseif vim.bo.filetype == "go" then
        vim.cmd("norm ofmt.Println(" .. message .. ")")
    elseif vim.bo.filetype == "lua" then
        vim.cmd("norm oprint(" .. message .. ")")
    end
end

M.smart_dd = function()
    if vim.api.nvim_get_current_line():match("^%s*$") then
        return '"_dd'
    else
        return "dd"
    end
end

return M
