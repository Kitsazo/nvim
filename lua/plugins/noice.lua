-- Noice
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("noice").setup {
            bottom_search = true,
            command_palette = true,
        }
    end,
}
