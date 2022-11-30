lvim.builtin.lualine.options.component_separators = { left = "", right = "" }
lvim.builtin.lualine.options.section_separators = { left = "", right = "" }

-- Disable Lualine Diagnostics
local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_x = {
    components.lsp,
    components.spaces,
    components.filetype,
}
