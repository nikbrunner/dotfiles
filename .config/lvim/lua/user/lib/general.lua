local M = {}

---Conditionally calls a function, otherwise calls an optional fallback
---The return of the provided functions get returned
---@param condition boolean Condition which decides if the callback gets called
---@param callback function():unknown Function which gets called if the Condition is true
---@param fallback? function():unknown Optional Function which gets called if Condition is false
---@return unknown|nil
M.ccall = function(condition, callback, fallback)
    if condition then
        return callback()
    else
        if fallback then
            return fallback()
        end
    end
end

---@param withExtension boolean Condition which decides if the returned filename should include the file extension
---@return string
M.get_current_filename = function(withExtension)
    if withExtension then
        return vim.fn.expand("%:t")
    else
        return vim.fn.expand("%:t:r")
    end
end

return M
