return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({ DEFAULT_OPTIONS = { css = true, css_fn = true } })
    end,
}
