local U = require("utils")

require("FTerm").setup({ dimensions = { height = 0.9, width = 0.9 } })

U.map("n", "<leader>t", "<CMD>lua require('FTerm').toggle()<CR>")
U.map(
    "n",
    "<leader>g",
    "<CMD>lua require('FTerm'):new({cmd = 'lazygit', dimensions={height=0.9,width=0.9}}):open()<CR>"
)
