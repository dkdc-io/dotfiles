-- options
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- fancy todo list
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = vim.fn.expand("~/.codai/todo.md"),
    callback = function()
        --local output = vim.fn.system("echo 'vimtest' >> ~/.codai/todo.md")
        local output = vim.fn.system("echo 'hello'")
        vim.cmd('edit!')
        vim.notify(output)
    end
})

-- colorscheme
-- vim.cmd [[colorscheme tokyonight]]
vim.cmd [[colorscheme github_dark_high_contrast]]

-- typos
vim.cmd("command! W w")
vim.cmd("command! Wq wq")
vim.cmd("command! WQ wq")
vim.cmd("command! Q q")

-- keymaps
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>s', ':split<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', '<C-o>', '<C-o>', { noremap = true, silent = true })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { noremap = true, silent = true })

-- macos clipboard
vim.opt.clipboard = 'unnamedplus'

-- git stuff
require('gitlinker').setup({
    opts = {
        add_current_line_on_normal_mode = true,
        action_callback = require('gitlinker.actions').open_in_browser,
    },
    -- Customize the mapping to your preference
    mappings = "<leader>gy" -- "\gy" to open in GitHub
})

-- git blame stuff
function ToggleGitBlame()
    if vim.b.gblame_buffer then
        vim.cmd("bdelete! " .. vim.b.gblame_buffer)
        vim.b.gblame_buffer = nil
    else
        vim.cmd("Git blame")
        vim.b.gblame_buffer = vim.fn.bufnr('%')
    end
end

vim.keymap.set('n', '<leader>gb', ToggleGitBlame, { noremap = true, silent = true })

-- tree
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 42,
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
vim.api.nvim_create_user_command('TC', 'NvimTreeClose', {})
vim.api.nvim_create_user_command('TreeClose', 'NvimTreeClose', {})

-- augroups
vim.api.nvim_create_augroup("AutoFormat", {})

-- quarto
require('quarto').setup {
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
        ft_runners = {},           -- filetype to runner, ie. `{ python = "molten" }`.
        -- Takes precedence over `default_method`
        never_run = { 'yaml' },    -- filetypes which are never sent to a code runner
    },
}

-- Python
require('lspconfig').ruff.setup {
    trace = 'messages',
    init_options = {
        settings = {
            logLevel = 'debug',
        }
    }
}

require('lspconfig').pyright.setup {
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

-- Go
require('lspconfig').gopls.setup {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true, -- Optional: set to true if you prefer gofumpt
        },
    },
}

vim.api.nvim_create_autocmd(
    "BufWritePre", -- Note: Using BufWritePre instead of BufWritePost for Go
    {
        pattern = "*.go",
        group = "AutoFormat",
        callback = function()
            vim.lsp.buf.format({ async = false })
            -- Alternatively, if you prefer gofmt directly:
            -- vim.cmd("silent !gofmt -w %")
        end,
    }
)

-- Rust
require('lspconfig').rust_analyzer.setup {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                command = "clippy",
            },
            procMacro = {
                enable = true
            },
            cargo = {
                allFeatures = true,
            },
        }
    }
}

vim.api.nvim_create_autocmd(
    "BufWritePre", -- Note: Using BufWritePre instead of BufWritePost for Rust
    {
        pattern = "*.rs",
        group = "AutoFormat",
        callback = function()
            vim.lsp.buf.format({ async = false })
            -- Alternatively, if you prefer rustfmt directly:
            -- vim.cmd("silent !rustfmt %")
        end,
    }
)

-- Lua
require('lspconfig').lua_ls.setup {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false, -- Disable third-party checking
            },
            telemetry = {
                enable = false,
            },
            format = {
                enable = true,
                -- You can specify formatting options here if needed
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "2",
                }
            },
        },
    },
}

vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        pattern = "*.lua",
        group = "AutoFormat",
        callback = function()
            -- If you want to use the LSP formatter:
            vim.lsp.buf.format({ async = false })

            -- Alternatively, if you prefer stylua directly:
            -- vim.cmd("silent !stylua %")
        end,
    }
)

-- SQL
require('lspconfig').sqlls.setup {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
}

-- copilot settings
vim.g.copilot_filetypes = {
    ["*"] = true, -- having trouble w/ .mdx files, doing this for now
}

-- file type associations
vim.filetype.add({
    extension = {
        lock = "toml",
        mdx = "markdown",
    },
    pattern = {
        [".*%.sql%.jinja"] = "sql",
    }
})
