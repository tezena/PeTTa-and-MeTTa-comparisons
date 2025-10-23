## MeTTa vs PeTTa interpreter comparison and observations

No |              Test Case               |  MeTTa  | PeTTa |  Observations   
---|--------------------------------------|---------|-------|----
1  | `!(bind! A B)`                       | ✅      | ❌    | Doesn't work on PeTTa
2  | `!(import! &tmp file)`               | ✅      | ❌    | Doesn't work on PeTTa
3  | `!(union-atom (1 2) (3 4))`          | ✅      | ❌    | Doesn't work on PeTTa
4  | `!(cons-atom 0 (1 2 3))`             | ✅      | ❌    | Doesn't work on PeTTa
5  | `!(decons-atom (1 2 3))`             | ✅      | ❌    | Doesn't work on PeTTa
6  | `!(intersection-atom (1 2) (3 4))`   | ✅      | ❌    | Doesn't work on PeTTa
7  | `!(car-atom (1 2 3))`                | ✅      | ✅    | Works on both
8  | `!(cdr-atom (1 2 3))`                | ✅      | ✅    | Works on both
8  | `!(superpose (1 2 3))`               | ✅      | ✅    | Works on both
8  | `!(collapse (superpose(1 2 3)))`     | ✅      | ✅    | Works on both
9  | `!(size-atom (1 2 3))`               | ✅      | ❌    | Doesn't work on PeTTa
10 | `!(index-atom (1 2 3) 1)`            | ✅      | ❌    | Doesn't work on PeTTa

## Extended built-ins coverage

Below are additional built-ins tested from the MeTTa stdlib pages. Each row shows whether it worked under MeTTa and PeTTa in this workspace, plus a brief note. Tests live alongside this document as `.metta` files named `tests_*.metta`.

### Equality and Reduction

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
11 | `(= (add 1 2) 3)` | ✅ | ✅ | Rule definition accepted; PeTTa shows Prolog clause translation
12 | `!(id 5)` | ✅ | ❌ | PeTTa prints unevaluated form `((id 5))`
13 | `!(=alpha (Father $X) (Father $Y))` | ✅ | ✅ | Both return True; different variable names considered alpha-equal
14 | `!(=alpha (Father $X) (Son $X))` | ✅ | ✅ | Both return False
15 | `!(assertEqual (+ 1 2) (- 6 3))` | ✅ | ❌ | PeTTa aborts; in MeTTa returns ()
16 | `!(assertAlphaEqual (+ $x $y) (+ $a $b))` | ✅ | ❌ | PeTTa aborts before running
17 | `!(assertEqualToResult (+ 1 2) 3)` | ✅ | ❌ | PeTTa aborts before running
18 | `!(assertAlphaEqualToResult (adder) ($y))` with `(= (adder) $x)` | ✅ | ❌ | PeTTa aborts before running

Notes: Intentionally failing variants of the assertions terminate both interpreters early, so they’re placed at the end of the test file.

### Error Handling

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
19 | `!(Error (add "a" 2) BadType)` | ✅ | ❌ | MeTTa constructs an Error atom but halts subsequent evaluation; PeTTa unsupported
20 | `!(if-error (Error 5 BadType) "Error!" "No error")` | ⚠️ | ❌ | Blocked by prior Error halting MeTTa run; PeTTa unsupported
21 | `!(return-on-error (Error 5 BadType) 6)` | ⚠️ | ❌ | Same as above

### Evaluation Control

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
22 | `!(function (return 5))` | ✅ | ❌ | PeTTa prints unevaluated form
23 | `!(eval (double 5))` with `(= (double $x) (+ $x $x))` | ✅ | ✅ | MeTTa returns `(+ 5 5)` then 10; PeTTa shows 10 for simple arithmetic
24 | `!(evalc (+ 5 5) &self)` | ✅ | ❌ | Unevaluated in PeTTa
25 | `!(chain (+ 2 3) $x (* $x 2))` | ✅ | ✅ | Returns 10 in both; PeTTa prints `(10)`
26 | `!(for-each-in-atom (1 3 5 62 2 5) print-each)` | ✅ | ❌ | MeTTa prints numbers and returns (); PeTTa unevaluated

### Mathematical Operations

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
27 | `!(pow-math 2 3)` | ✅ | ❌ | MeTTa 8.0; PeTTa unevaluated
28 | `!(sqrt-math 9)` | ✅ | ❌ | MeTTa 3.0
29 | `!(abs-math -5)` | ✅ | ❌ | MeTTa 5
30 | `!(log-math 10 100)` | ✅ | ❌ | MeTTa 2.0
31 | `!(trunc-math 5.6)` | ✅ | ❌ | MeTTa 5.0
32 | `!(ceil-math 5.2)` | ✅ | ❌ | MeTTa 6.0
33 | `!(floor-math 5.8)` | ✅ | ❌ | MeTTa 5.0
34 | `!(round-math 5.4)` | ✅ | ❌ | MeTTa 5.0
35 | `!(round-math 5.6)` | ✅ | ❌ | MeTTa 6.0
36 | `!(sin-math 0)` | ✅ | ❌ | MeTTa 0.0
37 | `!(asin-math 0)` | ✅ | ❌ | MeTTa 0.0
38 | `!(cos-math 0)` | ✅ | ❌ | MeTTa 1.0
39 | `!(acos-math 1)` | ✅ | ❌ | MeTTa 0.0
40 | `!(tan-math 0)` | ✅ | ❌ | MeTTa 0.0
41 | `!(atan-math 0)` | ✅ | ❌ | MeTTa 0.0
42 | `!(isnan-math 0.0)` | ✅ | ❌ | MeTTa False
43 | `!(isinf-math 0.0)` | ✅ | ❌ | MeTTa False
44 | `!(min-atom (2 6 7 4 9 3))` | ✅ | ❌ | MeTTa 2.0
45 | `!(max-atom (2 6 7 4 9 3))` | ✅ | ❌ | MeTTa 9.0
46 | `!(random-int &rng 2 9)` | ❌ | ❌ | Unevaluated in both (rng resource not available)
47 | `!(random-float &rng 2 9)` | ❌ | ❌ | Unevaluated in both (rng resource not available)

### Non-deterministic Computation

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
48 | `!(superpose (A B C))` | ✅ | ✅ | MeTTa returns nondet A,B,C; PeTTa prints `A B C`
49 | `!(collapse (superpose (A B C)))` | ✅ | ✅ | MeTTa `(A B C)`; PeTTa `((A B C))`
50 | `!(collapse-bind ...)` | ⚠️ | ⚠️ | Not tested here; requires proper `(Atom Bindings)` tuples
51 | `!(superpose-bind ...)` | ⚠️ | ⚠️ | Not tested here; requires proper `(Atom Bindings)` tuples

### Type System

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
52 | `!(is-function (-> Atom Atom))` | ✅ | ❌ | PeTTa unevaluated
53 | `!(is-function Atom)` | ✅ | ❌ | MeTTa False; PeTTa unevaluated
54 | `!(type-cast A type1 &self)` with `(: type1 Type)` | ✅ | ❌ | PeTTa unevaluated
55 | `!(type-cast 1 type1 &self)` | ✅ | ❌ | MeTTa returns Error (BadType); PeTTa unevaluated
56 | `!(match-types Atom Atom "Matched!" "Didn't match")` | ✅ | ❌ | MeTTa "Matched!"
57 | `!(match-types Atom Number "Matched!" "Didn't match")` | ✅ | ❌ | MeTTa "Didn't match"
58 | `!(first-from-pair (A B))` | ✅ | ❌ | MeTTa A
59 | `!(match-type-or True Number Bool)` | ✅ | ❌ | MeTTa True/False as per docs

### List Manipulation

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
60 | `!(format-args (Probability of {} is {}%) (head 50))` | ❌ | ❌ | MeTTa reports wrong args; likely needs stdlib formatting context
61 | `!(foldl-atom (1 2 3 4) 0 $acc $x (+ $acc $x))` | ❌ | ❌ | Not available in current MeTTa env; PeTTa unsupported
62 | `!(map-atom (1 2 3) $x (+ $x 1))` | ❌ | ❌ | Same as above
63 | `!(filter-atom (1 2 3 4 5) $x (> $x 3))` | ❌ | ❌ | Same as above

### Atomspace Interaction

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
64 | `!(add-reduct &self (= (add) (+ 1 3)))` | ✅ | ❌ | MeTTa adds reduced rule; PeTTa unevaluated
65 | `!(add-atom &self (= (add) (+ 1 3)))` | ✅ | ❌ | Adds unreduced atom; PeTTa prints true/unevaluated mix
66 | `!(get-type 1)` | ✅ | ✅ | Number in MeTTa; `(Number)` in PeTTa
67 | `(: a A)` then `!(get-type-space &self a)` | ✅ | ❌ | MeTTa A; PeTTa unevaluated
68 | `!(get-metatype True)` | ✅ | ✅ | Grounded in MeTTa; `(Grounded)` in PeTTa
69 | `!(get-metatype (a b))` | ✅ | ✅ | Expression
70 | `!(if-equal 1 1 "Equal" "Not Equal")` | ✅ | ❌ | MeTTa "Equal"; PeTTa unevaluated
71 | `!(new-space)` | ✅ | ❌ | Returns new space ref in MeTTa; PeTTa unevaluated
72 | `!(bind! state (new-state rest))` | ✅ | ❌ | MeTTa state works; PeTTa unevaluated
73 | `!(change-state! state active)` then `!(get-state state)` | ✅ | ❌ | MeTTa returns (State active) and active; PeTTa unevaluated
74 | `!(get-atoms &self)` | ✅ | ❌ | MeTTa lists atoms; PeTTa unsupported
75 | `!(match &self (= (add) (+ $x $y)) $x)` | ✅ | ✅ | MeTTa returns `1, 4`; PeTTa prints `1 1 4`

### Quoting

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
76 | `!(quote (+ 1 2))` | ✅ | ❌ | MeTTa returns quoted form; PeTTa unevaluated/incorrect
77 | `!(unquote (quote (+ 1 2)))` | ✅ | ❌ | MeTTa 3; PeTTa unevaluated
78 | `!(noreduce-eq (+ 1 2) (+ 1 2))` | ✅ | ❌ | MeTTa True; PeTTa unevaluated
79 | `!(noreduce-eq (+ 1 2) 3)` | ✅ | ❌ | MeTTa False; PeTTa duplicates True

### Set Operations

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
80 | `!(unique (superpose (a b c d d)))` | ✅ | ❌ | MeTTa `[d, c, b, a]`; PeTTa expands to unevaluated `(unique a)` etc.
81 | `!(union (superpose (a b b c)) (superpose (b c c d)))` | ✅ | ❌ | Works in MeTTa; PeTTa error in lists:union/3
82 | `!(intersection (superpose (a b c c)) (superpose (b c c c d)))` | ✅ | ❌ | Works in MeTTa; PeTTa unsupported
83 | `!(subtraction (superpose (a b b c)) (superpose (b c c d)))` | ✅ | ❌ | Works in MeTTa; PeTTa unsupported
84 | `!(unique-atom (a b c d d))` | ✅ | ❌ | Works in MeTTa; PeTTa unsupported
85 | `!(union-atom (a b b c) (b c c d))` | ✅ | ❌ | Works in MeTTa; PeTTa unsupported
86 | `!(intersection-atom (a b c c) (b c c c d))` | ✅ | ❌ | Works in MeTTa; PeTTa unsupported
87 | `!(subtraction-atom (a b b c) (b c c d))` | ✅ | ❌ | Works in MeTTa; PeTTa unsupported

Notes
- PeTTa consistently reports missing `library(nb_hashtbl)` at startup; many features appear unimplemented or disabled, leading to unevaluated forms or Prolog errors.
- Some stdlib functions (random, list manipulation) may does not support on this  MeTTa (v 0.2.8) environment