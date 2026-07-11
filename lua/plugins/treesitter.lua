vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    after = function()
      require('nvim-treesitter.configs').setup({
        auto_install = false,
        ensure_installed = {
          "vim", "bash", "lua", "python", "rust",
          "json", "c", "cpp", "markdown", "java",
          "html", "haskell", "sql", "ansible", "yaml"
        },
        highlight = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            node_incremental = "v",
            node_decremental = "V",
          }
        }
      })
    end
  }
})
