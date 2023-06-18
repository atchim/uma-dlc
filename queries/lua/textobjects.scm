;;;;;;;;
; Node ;
;;;;;;;;

_ @node
(_) @named-node

;;;;;;;;;;;;;;
; Swappables ;
;;;;;;;;;;;;;;

(arguments (_) @swappable)
(binary_expression [left: (_) @swappable right: (_) @swappable])
(field) @swappable
(parameters (_) @swappable)