local lib = require("user.lib")
local builtin = require("telescope.builtin")
local previewers = require("telescope.previewers")
local themes = require("telescope.themes")

local M = {}

local delta_previewer = previewers.new_termopen_previewer({
    get_command = function(entry)
        -- this is for status
        -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
        -- just do an if and return a different command
        if entry.status == "??" or "A " then
            return {
                "git",
                "-c",
                "core.pager=delta",
                "-c",
                "delta.side-by-side=false",
                "diff",
                entry.value,
            }
        end

        -- note we can't use pipes
        -- this command is for git_commits and git_bcommits
        return {
            "git",
            "-c",
            "core.pager=delta",
            "-c",
            "delta.side-by-side=false",
            "diff",
            entry.value .. "^!",
        }
    end,
})

local hard_corner_window = function()
    return {
        { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
        results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    }
end

local no_preview = function()
    return themes.get_dropdown({
        borderchars = hard_corner_window(),
        width = 0.8,
        previewer = false,
        prompt_title = false,
    })
end

M.find_related_files = function()
    local current_filename = lib.general.get_current_filename(false)

    if current_filename then
        builtin.find_files({
            default_text = current_filename,
        })
    else
        builtin.find_files()
    end
end

M.find_changed_files = function()
    builtin.git_status(themes.get_ivy({ previewer = delta_previewer }))
end

M.find_commits = function()
    builtin.git_commits({ previewer = delta_previewer })
end

M.find_files_without_preview = function()
    builtin.find_files(no_preview())
end

M.find_files_with_preview = function()
    builtin.find_files(themes.get_ivy())
end

M.find_in_file = function()
    builtin.current_buffer_fuzzy_find(themes.get_ivy({}))
end

M.find_text = function()
    builtin.live_grep(themes.get_ivy({}))
end

M.find_word = function()
    local curr_word = vim.fn.expand("<cword>")
    builtin.grep_string({ default_text = curr_word })
end

M.find_open_buffer = function()
    builtin.buffers(themes.get_dropdown({ initial_mode = "insert" }))
end

return M
