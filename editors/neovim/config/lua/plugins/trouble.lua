local keymaps = require("core.keymaps")
require("core.pack").add({
    {
        src = "https://github.com/folke/trouble.nvim",
        data = {
            config = function()
                require("trouble").setup()
                keymaps.add({
                    {"<leader>td", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)"},
                })
            end
        }
    }
})
