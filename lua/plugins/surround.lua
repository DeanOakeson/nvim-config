vim.pack.add({ {
    src = "https://github.com/kylechui/nvim-surround",
    version = vim.version.range("4.x"), -- Use for stability; omit to use `main` branch for the latest features
} })
require('nvim-surround').setup({

    -- insert = "<C-g>s",
    -- insert_line = "<C-g>S",
    --  normal = "s",
    -- normal_cur = "ss",
    -- normal_line = "S",
    -- normal_cur_line = "SS",
    -- visual = "s",
    -- visual_line = "gS",
    --  delete = "ds",
    --  change = "cs",
    --  change_line = "cS",
   -- move_cursor = "sticky"
})

--insert
vim.keymap.set("i", "<C-g>s", "<Plug>(nvim-surround-insert)", { 
    desc = "surround (insert)"
})
vim.keymap.set("i", "<C-g>S", "<Plug>(nvim-surround-insert-line)",{
    desc = "surround on new lines (insert)"
})
--normal
vim.keymap.set("n","s", "<Plug>(nvim-surround-normal)",{
    desc = "surround (normal)"
})
vim.keymap.set("n","ss", "<Plug>(nvim-surround-normal-cur)",{
    desc = "surround current line"
})
vim.keymap.set("n","S", "<Plug>(nvim-surround-normal-line)",{
    desc = "surorund current line, new lines"
})
--visual
vim.keymap.set("x","s", "<Plug>(nvim-surround-visual)",{
    desc = "surround highlighted in visual mode"
})
vim.keymap.set("x","gS", "<Plug>(nvim-surround-visual_line)",{
    desc = "Surround highlighted line in visual mode"
})

--delete
vim.keymap.set("n", "ds", "<Plug>(nvim-surround-delete)", {
        desc = "Delete surrounding",
})
vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change)", {
        desc = "Change surrounding",
})
vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change-line)", {
        desc = "Change surround, new line",
})







