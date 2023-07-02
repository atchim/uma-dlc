(fn opts []
  (local dashboard (require :alpha.themes.dashboard))

  (local art
    [ " ▓ ▓ ▓▓ ▓▓ ▓▓▓                  ░░░░░░  ░░░░"
      "░▓░▓░▓▓░▓▓░▓░▓                ░▒▒▒▒▒▒▒░▒▒▒▒▒░░"
      "░▓░▓░▓░▓░▓░▓▓▓               ░▒▒▒▒▒░░░░░░▒░░▒▒▒░"
      "░▓▓▓░▓░▓░▓░▓░▓              ░▒▒▒▒▒░▒▒▒▒▒▒░▒▒▒▒▒▒░"
      "░░░ ░ ░ ░ ░ ░             ░▒▒░░▒▒▒▓░▒▓▓▒▓▓░▒░▒▓▒░▓░"
      " ▓▓  ▓    ▓▓ ▓          ░▒▒▒░▓▓░░▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒░"
      "░▓ ▓░▓   ▓░ ░▓        ░▒▒▒▒▒░▓▒▓▓▓▓▓▓▓▒▒▒▒▓▓▓▓▒▒▒▒▒░"
      "░▓░▓░▓  ░▓  ░        ░▒▒▒▒▒▒░▓▓▓▓▓▓▓▓▓░░░█▒▓▓▒░░▓█▒"
      "░▓▓ ░▓▓▓░ ▓▓ ▓     ░▒▒▒▒▒▒▒▒▒▒░▓▓▓▓▓▓▒▓▒▒▒▓▒▓▒▒▓▓▒▒░"
      "░░  ░░░  ░░ ░    ░▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▒▒▒▓▒▒▒▓▓▒░"
      "           ▓   ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓▓▓▓▓▓▓▓▒▒▓░▒░▓▒▓▓▓▓▓░"
      "          ░  ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▒░▒▓▓▓▒▓▓▓▓▓▓▓▓▒▓▓▒▒░"
      "            ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▓▓▓▓▒░░░▒▒▒▒▒▒▒▒▒▒▒░░░░"
      "           ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒▓▓▓▒▓░░░░░░░░░░░▒▒▒░"
      "          ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒▒░▒▓▒▒▒▒▒▒▒▓▒▒▒▓▒▓░"
      "         ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░▓▓▒▓▓░▓░▓░▒▓░▓▒▓▒▓▒▓▒▓▒░"
      "        ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▓▓▓▓▓▓▓░▓▓░▓░▓▒▓▓▓▓▓▓▓▒░"
      "       ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒▒▒▒▒▒▒░▒░▓▓▓▓▓▓░▒░▒░▒▒▓▓▓▓▓░▒▒░"
      "      ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒▒▒▒▒▒░▒▒▒▒░░░░░▒▒▒▒▒▒░ ▒░░▒▒▒▒░"
      "     ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░  ░▒▒▒▒▒"
      "    ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒░▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░ ░▒▒▒▒▒░"
      "    ░▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒░▒▒▒▒▒▒░▒▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░▒▒▒▒▒░"
      "   ░▒▒▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒▒░▒▒░▒▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒▒▒▒▒▒░"])
  (set dashboard.section.header.val art)

  (set dashboard.section.buttons.val
    [ (dashboard.button :e "  New file" "<Cmd>ene <BAR> startinsert<CR>")
      (dashboard.button :f "  Find files" "<Cmd>Telescope find_files<CR>")
      (dashboard.button :g "  Live grep" "<Cmd>Telescope live_grep<CR>")
      (dashboard.button :o "  Recent files" "<Cmd>Telescope oldfiles<CR>")
      (dashboard.button :h "🩺 Check health" :<Cmd>checkhealth<CR>)
      (dashboard.button :l "󰒲  Lazy" :<Cmd>Lazy<CR>)
      (dashboard.button :m "🧱 Mason" :<Cmd>Mason<CR>)
      (dashboard.button :q "  Quit" :<Cmd>qa<CR>)])

  (each [_ button (ipairs dashboard.section.buttons.val)]
    (set button.opts.hl :String)
    (set button.opts.hl_shortcut :Statement))
  (set dashboard.section.header.opts.hl :Constant)

  dashboard.opts)

{ 1 :goolord/alpha-nvim
  :name :alpha
  :event :VimEnter
  : opts
  :dependencies :kyazdani42/nvim-web-devicons}