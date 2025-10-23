; Type System built-ins tests

; is-function
!(is-function (-> Atom Atom))
!(is-function Atom)

; type-cast
(: type1 Type)
!(type-cast A type1 &self)

; match-types
!(match-types Atom Atom "Matched!" "Didn't match")
!(match-types Atom Number "Matched!" "Didn't match")

; first-from-pair
!(first-from-pair (A B))

; match-type-or
!(match-type-or True Number Number)
!(match-type-or False Number Number)
!(match-type-or True Number Bool)
!(match-type-or False Number Bool)
; Place error-producing cast at the end to avoid aborting early
!(type-cast 1 type1 &self)
