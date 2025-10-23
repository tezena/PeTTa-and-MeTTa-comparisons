!(bind! &space (new-space))

!(union-atom (1 2 3) (3 4 5))

!(cons-atom 0 (1 2 3))
!(decons-atom (1 2 3))
!(intersection-atom (1 2 3 4) (3 4 5 6))

!(superpose (1 2 3))
!(collapse (superpose (1 2 3)))

!(car-atom (1 2 3))
!(cdr-atom (1 2 3))


; !(fab 5)

; (= (bin) 0)
; (= (bin) 1)

; (= (get_bin $n)(
;    if (== $n 0) () (:: (bin) (get_bin (- $n 1))) 
; ))

; !(get_bin 3)

; (= (fab $x) (if (== $x 1) 1 (* $x (fab (- $x 1)))))

; (= (fib $n)(
;    if (<= $n 1)
;       $n
;       (+ (fib (- $n 1)) (fib (- $n 2)))
; ))

; !(fib 35)  ; 8.07s PeTTa, 210min - still going - MeTTa (hyperon python)

; (= (fibonacci $n)(
;    case $n (
;       (0 0)
;       (1 1)
;       ($_ (+ (fibonacci (- $n 1)) (fibonacci (- $n 2))))
;    )
; ))

; ; !(fibonacci 5)

(: factorial (-> Number Number))
(= (factorial $x)(
   case $x (
      (0 1)
      ($_ (* $x (factorial (- $x 1))))
   )
))


!(factorial 20)


