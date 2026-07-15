return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "vue_ls", "cssls", "html", "ts_ls" },
                automatic_enable = false,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local servers = {
                lua_ls = {},
                pyright = {},
                vue_ls = {
                    init_options = { typescript = { tsdk = "/usr/local/lib/node_modules/typescript/lib" } },
                },
                cssls = {},
                html = {},
                ts_ls = {},
            }

            for server, config in pairs(servers) do
                config.capabilities = capabilities
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            end

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
