return {
  'arnamak/stay-centered.nvim',
  lazy = false,
  config = function()
    require('stay-centered').setup()
    vim.keymap.set({ 'n', 'v' }, '<leader>st', require('stay-centered').toggle, { desc = 'Toggle stay-centered' })
  end,
}
