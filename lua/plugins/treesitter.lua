vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

-- Replaces ensure_installed — install explicitly (async by default)
require('nvim-treesitter').install({
    "nix", "vim", "bash", "lua", "python", "rust",
    "json", "c", "cpp", "markdown", "java", "html", "javascript", "typescript",
})

-- Replaces highlight.enable = true
vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        "nix", "vim", "bash", "lua", "python", "rust",
        "json", "c", "cpp", "markdown", "java", "html", "javascript", "typescript",

    },
    callback = function()
        vim.treesitter.start()
    end,
})
