(fn on_attach [bufnr]
  (local gs (require :gitsigns))

  (fn map! [mode lhs rhs ?opts]
    (local opts (or ?opts {}))
    (set opts.buffer bufnr)
    (vim.keymap.set mode lhs rhs opts))

  (macro set-mappings! [mappings]
    `(do
      ,(unpack
        (icollect [_ [lhs rhs desc ?opts] (ipairs mappings)]
          (let [opts (or ?opts {}) mode (or opts.mode :n)]
            (set opts.desc desc)
            (set opts.mode nil)
            `(map! ,mode ,lhs ,rhs ,opts))))))

  (set-mappings!
    [ [ "[c"
        #(if vim.wo.diff "[c" (do (vim.schedule #(gs.prev_hunk)) :<Ignore>))
        "Hunk go to previous"
        {:expr true}]
      [ "]c"
        #(if vim.wo.diff "]c" (do (vim.schedule #(gs.next_hunk)) :<Ignore>))
        "Hunk go to next"
        {:expr true}]
      [:<Leader>gb #(gs.blame_line {:full true}) "Blame in line"]
      [:<Leader>gd gs.diffthis "Diff this"]
      [:<Leader>gD #(gs.diffthis "~") "Diff this ~"]
      [:<Leader>gp gs.preview_hunk "Hunk preview"]
      [:<Leader>gr gs.reset_hunk "Hunk reset"]
      [ :<Leader>gr
        #(gs.reset_hunk [(vim.fn.line :.) (vim.fn.line :v)])
        "Hunk reset"
        {:mode :v}]
      [:<Leader>gR gs.reset_buffer "Hunk buffer reset"]
      [:<Leader>gs gs.stage_hunk "Hunk stage"]
      [ :<Leader>gs
        #(gs.stage_hunk [(vim.fn.line :.) (vim.fn.line :v)])
        "Hunk stage"
        {:mode :v}]
      [:<Leader>gS gs.stage_buffer "Hunk buffer stage"]
      [:<Leader>gu gs.undo_stage_hunk "Hunk stage undo"]
      [:<Leader>tb gs.toggle_current_line_blame "Blame in line"]
      [:<Leader>td gs.toggle_deleted "Hunk deleted"]
      [:ih "<Cmd><C-U>Gitsigns select_hunk<CR>" "Hunk" {:mode [:o :x]}]]))

{ 1 :lewis6991/gitsigns.nvim
  :event [:BufNewFile :BufReadPre]
  :opts {: on_attach}
  :dependencies :atchim/sopa.nvim}