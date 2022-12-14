local i_map = lvim.keys.insert_mode

i_map["kj"] = "<ESC>"

-- Copilot
i_map["<C-h>"] = require("copilot.suggestion").dismiss
i_map["<C-l>"] = require("copilot.suggestion").accept
i_map["<C-n>"] = require("copilot.suggestion").next
i_map["<C-p>"] = require("copilot.suggestion").prev
