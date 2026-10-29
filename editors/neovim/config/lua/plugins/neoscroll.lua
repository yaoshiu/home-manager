require("core.pack").add({
    {
        src = "https://github.com/karb94/neoscroll.nvim",
        data = {
            config = function()
                require("neoscroll").setup({})
            end
        }
    }
})
