-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- General Keymaps -------------------

-- clear search highlights
keymap.set("n", "<leader>c", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab


-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>") -- find recent files
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>") -- list available help tags

-- vim maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "tt", "<cmd>Oil<CR>", { desc = "Open parent directory in Oil" })

-- middleout (ServiceNow script extraction)
keymap.set("n", "<leader>mi", function()
  local out = vim.fn.system("middleout init -d " .. vim.fn.getcwd())
  vim.notify(out, vim.log.levels.INFO, { title = "middleout init" })
end, { desc = "middleout: init project" })

keymap.set("n", "<leader>me", function()
  local out = vim.fn.system("middleout extract -d " .. vim.fn.getcwd())
  vim.notify(out, vim.log.levels.INFO, { title = "middleout extract" })
end, { desc = "middleout: extract all scripts" })

keymap.set("n", "<leader>ms", function()
  local out = vim.fn.system("middleout sync -d " .. vim.fn.getcwd())
  vim.notify(out, vim.log.levels.INFO, { title = "middleout sync" })
end, { desc = "middleout: sync .js → XML" })

