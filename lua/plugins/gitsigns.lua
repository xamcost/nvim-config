return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- stylua: ignore start
      map("n", "]g", gs.next_hunk, "Next Hunk")
      map("n", "[g", gs.prev_hunk, "Prev Hunk")
      map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>gr", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>gp", gs.preview_hunk_inline, "Preview Hunk Inline")
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>gd", gs.diffthis, "Diff This")
      map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff This ~")
    end,
  },
}
