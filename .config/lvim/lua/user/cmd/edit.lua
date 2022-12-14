local lib = require("user.lib")

local M = {}

local AUTO_LOG_PREFIX = "Test"

local get_auto_print_cmd = function(filetype)
    if
        filetype == "typescript"
        or filetype == "typescriptreact"
        or filetype == "javascript"
        or filetype == "javascriptreact"
    then
        -- Return the print command for JavaScript-like languages
        return 'console%.log%("' .. AUTO_LOG_PREFIX
    elseif filetype == "go" then
        -- Return the print command for Go
        return 'fmt%.Println%("' .. AUTO_LOG_PREFIX
    elseif filetype == "lua" then
        -- Return the print command for Lua
        return 'print%("' .. AUTO_LOG_PREFIX
    end
end

-- TODO: Use treesitter and print this to the next ( empty ) line
M.log_symbol = function()
    local current_word = vim.fn.expand("<cword>")
    local current_filename = lib.general.get_current_filename(true)

    local message = table.concat({
        '"',
        AUTO_LOG_PREFIX,
        ": ",
        current_filename,
        " [[",
        current_word,
        ']]", ',
        current_word,
    })

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

M.delete_logs = function()
    local buffer = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)
    local new_lines = {}

    -- Get the print command for the current filetype
    local print_cmd = get_auto_print_cmd(vim.bo.filetype)

    -- Initialize a counter for the deleted lines
    local deleted_lines = 0
    for _, line in ipairs(lines) do
        -- Check if the line contains the print command
        if string.find(line, print_cmd) == nil then
            -- If not, add the line to the new lines
            table.insert(new_lines, line)
        else
            -- Increment the counter for deleted lines
            deleted_lines = deleted_lines + 1
        end
    end

    -- Replace the buffer's lines with the new lines
    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, new_lines)

    -- Use vim.notify to display the number of deleted lines
    vim.notify("Deleted " .. deleted_lines .. " lines")
end

M.undo = function()
    local isNvimTreeOpen = require("nvim-tree.view").is_visible()

    vim.cmd("let g:undotree_SplitWidth = 40")

    if isNvimTreeOpen then
        -- Close NvimTree to prevent double sidebars
        vim.cmd.NvimTreeClose()
        vim.cmd.UndotreeToggle()
    else
        vim.cmd.UndotreeToggle()
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
