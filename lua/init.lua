vim.g.mapleader = " "

require('nvim-treesitter.configs').setup {
  ensure_installed = { "cpp", "javascript" }, -- You can add "c", "lua", etc., if needed
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true, -- This turns on Treesitter-based syntax highlighting
    additional_vim_regex_highlighting = false,
    },
}
