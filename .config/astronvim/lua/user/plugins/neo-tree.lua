return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
      sort_function = function(a, b)
        -- Sort on path if types the same else files come before directories
        if a.type == b.type then
          return a.path < b.path
        end
        return a.type == 'file'
      end,
  }
}
