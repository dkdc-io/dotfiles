-- python
require('lspconfig').ruff.setup {
  trace = 'messages',
  init_options = {
    settings = {
      logLevel = 'debug',
    }
  }
}

require('lspconfig').pyright.setup{
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                extraPaths = { ".venv/lib/python3.*/site-packages" },
                diagnosticMode = "off",
                autoImportCompletions = false,
            },
            linting = {
                enabled = false,
            }
        }
    },
    -- Disable all diagnostics from Pyright
    handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
    }
}

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', '<C-o>', '<C-o>', { noremap = true, silent = true })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })

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

vim.api.nvim_create_user_command('T', 'NvimTreeOpen', {})
vim.api.nvim_create_user_command('Tree', 'NvimTreeOpen', {})
vim.api.nvim_create_user_command('TreeOpen', 'NvimTreeOpen', {})
vim.api.nvim_create_user_command('TreeClose', 'NvimTreeClose', {})

-- quarto
require('quarto').setup{
  debug = true,
  closePreviewOnExit = true,
  lspFeatures = {
    enabled = true,
    chunks = "curly",
    languages = { "python", "bash", "html" },
    diagnostics = {
      enabled = true,
      triggers = { "BufWritePost" },
    },
    completion = {
      enabled = true,
    },
  },
  codeRunner = {
    enabled = true,
    default_method = "molten", -- "molten", "slime", "iron" or <function>
    ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
    -- Takes precedence over `default_method`
    never_run = { 'yaml' }, -- filetypes which are never sent to a code runner
  },
}

-- viz
-- vim.cmd('syntax on')
vim.opt.number = true
--vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.cmd[[colorscheme tokyonight]]

-- typos
vim.cmd("command! W w")
vim.cmd("command! Wq wq")
vim.cmd("command! WQ wq")
vim.cmd("command! Q q")

-- macos clipboard
vim.opt.clipboard = 'unnamedplus'
