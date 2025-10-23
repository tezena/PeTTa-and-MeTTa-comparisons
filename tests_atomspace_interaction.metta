; Atomspace Interaction built-ins tests

; add-reduct and add-atom
!(add-reduct &self (= (add) (+ 1 3)))
!(add-atom &self (= (add) (+ 1 3)))

; get-type and get-type-space
!(get-type 1)
(: a A)
!(get-type-space &self a)

; get-metatype
!(get-metatype True)
!(get-metatype (a b))

; if-equal
!(if-equal 1 1 "Equal" "Not Equal")
!(if-equal 1 2 "Equal" "Not Equal")

; new-space
!(new-space)

; state operations
!(bind! state (new-state rest))
!(change-state! state active)
!(get-state state)

; list all atoms (may be verbose)
!(get-atoms &self)

; match
(= (add) (+ 1 2))
(= (add) (+ 4 2))
!(match &self (= (add) (+ $x $y)) $x)
