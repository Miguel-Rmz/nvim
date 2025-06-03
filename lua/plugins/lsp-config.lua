    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "volar", "cssls", "html", "ts_ls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.pyright.setup({ capabilities = capabilities })
            lspconfig.volar.setup({
                capabilities = capabilities,
                init_options = { typescript = { tsdk = "/usr/local/lib/node_modules/typescript/lib" } },
            })
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities, single_file_support = true })
            -- global mappings
            vim.diagnostic.config({ virtual_text = false })
            vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float)
            vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev)
            vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next)
            vim.keymap.set("n", "<leader>lh", vim.diagnostic.hide)
            vim.keymap.set("n", "<leader>ls", vim.diagnostic.show)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, opts)
        end,
    },
}
