vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorlineopt = 'number'
vim.opt.cursorline = true
vim.opt.mouse = "n"
vim.opt.spellsuggest = "best,10"
vim.opt.scrolloff = 3
vim.opt.undofile = true;
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.winborder = 'double'
vim.opt.swapfile = false;
vim.cmd(":hi StatusLine guibg=NONE")
vim.opt.laststatus = 3
vim.opt.statusline = "%F %m %r %= %y %p%% Line:%l/%L"
vim.opt.title = true
vim.cmd("colorscheme darkblue")


-- id: (number) autocommand id
-- event: (string) name of the triggered even| autocmd-events
-- group: (number|nil) autocommand group id, if any
-- match: (string) expanded value of |<amatch>|
-- buf: (number) expanded value of |<abuf>|
-- file: (string) expanded value of |<afile>|
-- data: (any) arbitrary data passed |nvim_exec_autocmds()|

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
local javascript = vim.api.nvim_create_augroup("JavaScript", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text on yank.",
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end
})

vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end
})

vim.api.nvim_create_autocmd("BufWriteCmd" , "FileType" {
  desc = "Run npx prettier.",
  group = javascript,
  pattern = {"*.js", "*.ts"}
  callback = function(ev)
    local cmd = string.format("npx prettier --write %s", ev.file)
    vim.fnd.system(cmd)
  end
})

local excluded_formatting_filetypes = { "*html" }

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end
    if client:supports_method('textDocument/formatting', args.buf) then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        end
      })
    end
  end,
})
