return {
    n = {
        [";"] = { ":", silent = false, desc = "Quick cmd" },
        ["<enter>"] = { ":noh<enter><cr>", silent = true, desc = "No highlight" },
        j = { "v:count==0 ? 'gj' : 'j'", expr = true },
        k = { "v:count==0 ? 'gk' : 'k'", expr = true },
    },
}

-- Shift line/block up/down
-- map("n", "<C-j>", ":move .+1<CR>")
-- map("n", "<C-k>", ":move .-2<CR>")
-- map("v", "<C-j>", ":move '>+1<CR>gv=gv")
-- map("v", "<C-k>", ":move '<-2<CR>gv=gv")
