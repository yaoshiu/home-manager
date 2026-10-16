require("core.pack").add({
    "https://github.com/rktjmp/lush.nvim",
    {
        src = "https://github.com/zenbones-theme/zenbones.nvim",
        config = function()
            vim.cmd.colorscheme("zenbones")
        end
    },
})
