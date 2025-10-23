; List Manipulation built-ins tests

; format-args
!(format-args (Probability of {} is {}%) (head 50))

; foldl-atom
!(foldl-atom (1 2 3 4) 0 $acc $x (+ $acc $x))

; map-atom
!(map-atom (1 2 3) $x (+ $x 1))

; filter-atom
!(filter-atom (1 2 3 4 5) $x (> $x 3))
