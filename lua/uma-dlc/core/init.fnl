(import-macros {: modcall} :soupmacs.soupmacs)

(fn set-mapleader! []
  "Sets `mapleader` to `<Space>`."
  (vim.keymap.set :n :<Space> :<NOP>)
  (set vim.g.mapleader " "))

(fn setup! []
  (set-mapleader!)
  (let
    [ mods
      [ :options
        :globals
        :autocommands
        :commands
        :key-mappings
        :diagnostics
        :lazy]]
    (each [_ mod (ipairs mods)] (modcall (.. :uma-dlc.core. mod) :setup! []))))

{: setup!}