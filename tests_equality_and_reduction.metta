; Equality and Reduction built-ins tests

; define a simple reduction rule
(= (add 1 2) 3)

; id
!(id 5)

; =alpha
!(=alpha (Father $X) (Father $Y))
!(=alpha (Father $X) (Son $X))

; assertEqual (success first)
!(assertEqual (+ 1 2) (- 6 3))

; assertAlphaEqual (success first)
!(assertAlphaEqual (+ $x $y) (+ $a $b))

; assertEqualToResult (success first)
!(assertEqualToResult (+ 1 2) 3)

; assertAlphaEqualToResult (success first)
(= (adder) $x)
!(assertAlphaEqualToResult (adder) ($y))

; error-producing variants at the end (may terminate interpreter)
!(assertEqual (+ 1 2) (+ 2 2))
!(assertAlphaEqual (+ $x $y) (- $x $y))
!(assertEqualToResult (+ 1 2) (+ 1 2))
!(assertAlphaEqualToResult (adder) (adder))
