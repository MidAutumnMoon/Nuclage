{ vimPlugins, tree-sitter }:

vimPlugins.nvim-treesitter.withPlugins (_: tree-sitter.allGrammars)
