-- General options
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- Mouse and mode settings
vim.opt.mouse = "a"
vim.opt.showmode = false

-- Indentation and line-breaking
vim.opt.breakindent = true

-- File and undo options
vim.opt.undofile = true

-- Search behavior
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Timing
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Incremental search
vim.opt.inccommand = "split"

-- Netrw settings
vim.g.netrw_banner = 0

-- Folding settings
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
