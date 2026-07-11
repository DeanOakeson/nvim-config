
vim.pack.add({ {src="https://github.com/nvim-lua/plenary.nvim"}, {src="https://github.com/nvim-telescope/telescope.nvim"} })
require('telescope').setup{
    defaults = {
        mappings = {
            i={
                ["C-h>"] = "which_key"
        }
    }
},
pickers = {

},
extensions = {

}
}
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>")
