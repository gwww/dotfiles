local map = require("utils").map

require("FTerm").setup({ dimensions = { height = 0.9, width = 0.9 } })

map("n", "<leader>t", function() require("FTerm").toggle() end)
map(
    "n",
    "<leader>g",
    function() require("FTerm"):new({ cmd = "lazygit", dimensions = { height = 0.9, width = 0.9 } }):open() end
)
