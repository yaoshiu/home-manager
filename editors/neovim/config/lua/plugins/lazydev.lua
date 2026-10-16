require("core.pack").add({
    {
        src = "https://github.com/folke/lazydev.nvim",
        data = {
            config = function()
                require("lazydev").setup()
            end
        }
    }
})
