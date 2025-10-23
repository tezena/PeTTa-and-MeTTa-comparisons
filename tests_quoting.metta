; Quoting built-ins tests

!(quote (+ 1 2))
!(unquote (quote (+ 1 2)))
!(noreduce-eq (+ 1 2) (+ 1 2))
!(noreduce-eq (+ 1 2) 3)
