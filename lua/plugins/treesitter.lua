return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdateSync",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            auto_install = true,
            sync_install = false,
            ensure_installed = { "markdown", "markdown_inline" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
