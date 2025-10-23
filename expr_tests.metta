; Expression Manipulation built-ins test suite
; Order matters for mapping outputs to functions.

; 1. cons-atom
!(cons-atom 1 (2 3))

; 2. decons-atom
!(decons-atom (1 2 3))

; 3. car-atom
!(car-atom (1 2 3))

; 4. cdr-atom
!(cdr-atom (1 2 3))

; 5. size-atom
!(size-atom (1 2 3))

; 6. index-atom
!(index-atom (1 2 3) 1)
