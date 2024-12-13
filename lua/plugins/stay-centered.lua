return {
  'arnamak/stay-centered.nvim',
  lazy = false,
  enabled = false,
  config = function()
    require('stay-centered').setup({
      skip_filetypes = { 'markdown' }
    })
    vim.keymap.set({ 'n', 'v' }, '<leader>st', require('stay-centered').toggle, { desc = 'Toggle stay-centered' })
  end,
}
