-- python
require('lspconfig').ruff.setup {
  trace = 'messages',
  init_options = {
    settings = {
      logLevel = 'debug',
    }
  }
}

vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.py",
        group = "AutoFormat",
        callback = function()
            vim.cmd("silent !ruff format %")            
            vim.cmd("edit")
        end,
    }
)

-- tree
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- viz
-- Enable syntax highlighting
vim.cmd('syntax on')

-- Enable line numbers
vim.opt.number = true

-- Optional: Enable relative line numbers
--vim.opt.relativenumber = true

-- Other styles: night, storm, day, moon
vim.cmd[[colorscheme tokyonight]]

