; Evaluation Control built-ins tests

; return / function
!(function (return 5))
!(function (return (+ 1 2)))

; eval / evalc
(= (double $x) (+ $x $x))
!(eval (double 5))
!(eval (+ 5 5))
!(evalc (double 5) &self)
!(evalc (+ 5 5) &self)

; chain
!(chain (+ 2 3) $x (* $x 2))

; for-each-in-atom (prints lines, returns ())
(= (print-each $x) (println! $x))
!(for-each-in-atom (1 3 5 62 2 5) print-each)
