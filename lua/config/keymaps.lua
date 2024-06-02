-- Keymaps are automatically loaded on the VeryLazy event

-- Shorten function name
local map = vim.keymap.set

-- Remap space as leader
-- map("", "<Space>", "<Nop>", opts)

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Navigate buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- New file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
-- map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- Diagnostics
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Diagnostic popup" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "List diagnostics" })
-- Toggle diagnostics
local diagnostics_active = true
local function toggle_diagnostics()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end
vim.keymap.set("n", "<leader>lh", toggle_diagnostics, { desc = "Toggle diagnostics", noremap = true, silent = true })

-- Code navigation
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    map("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
    map("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
    map("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Help" })
    map("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Go to implementation" })
    map("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "Add workspace folder" })
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = "Remove workspace folder" })
    map("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = ev.buf, desc = "List workspace folders" })
    map("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Go to type definition" })
    map("n", "<leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename all references" })
    map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code actions" })
    map("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "References" })
    -- map('n', '<leader>lf', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})

-- Terminals
local function lazygit_toggle()
  require("toggleterm.terminal").Terminal
      :new({
        cmd = "lazygit",
        direction = "float",
        float_opts = {
          border = "double",
        },
      })
      :toggle()
end
map("n", "<leader>gg", lazygit_toggle, { desc = "ToggleTerm lazygit", noremap = true, silent = true })
map("n", "<leader>tl", lazygit_toggle, { desc = "ToggleTerm lazygit", noremap = true, silent = true })
