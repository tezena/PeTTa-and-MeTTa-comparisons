; Set Operations built-ins tests

!(unique (superpose (a b c d d)))
!(union (superpose (a b b c)) (superpose (b c c d)))
!(intersection (superpose (a b c c)) (superpose (b c c c d)))
!(subtraction (superpose (a b b c)) (superpose (b c c d)))

!(unique-atom (a b c d d))
!(union-atom (a b b c) (b c c d))
!(intersection-atom (a b c c) (b c c c d))
!(subtraction-atom (a b b c) (b c c d))
