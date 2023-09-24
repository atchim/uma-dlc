(fn setup []
  (fn map! [mode lhs rhs ?opts]
    (local opts (or ?opts {}))
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
    [ [:<C-H> #(vim.lsp.buf.signature_help) "LSP signature help"]
      [:<Leader>lf #(vim.lsp.buf.format) "Format"]
      [:<Leader>ls #(vim.lsp.buf.document_symbol) "Document symbols"]
      [:<Leader>lS #(vim.lsp.buf.workspace_symbol) "Workspace symbols"]
      [:cr #(vim.lsp.buf.rename) "LSP symbol rename"]
      [:gd #(vim.lsp.buf.declaration) "LSP symbol declaration"]
      [:gD #(vim.lsp.buf.type_definition) "LSP type definition"]
      [:gm #(vim.lsp.buf.implementation) "LSP implementations"]
      [:go #(vim.lsp.buf.code_action) "LSP code action"]
      [:gr #(vim.lsp.buf.references) "LSP references"]]))

{: setup}