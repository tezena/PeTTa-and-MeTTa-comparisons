; Error Handling built-ins tests

; Error
!(Error (add "a" 2) BadType)

; if-error
!(if-error (Error 5 BadType) "Error!" "No error")
!(if-error 5 "Error!" "No error")

; return-on-error
!(return-on-error (Error 5 BadType) 6)
!(return-on-error 5 6)
