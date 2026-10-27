#lang sicp

; Suppose we define the procedure
(define (f g) (g 2))

; Then we have

;(f square)


(f (lambda (z) (* z (+ z 1))))


; What happens if we (perversely) ask the interpreter to evaluate the combination (f f)? Explain.

; If we try to evaluate (f f) we will run into an error saying the following:
;application: not a procedure;
; expected a procedure that can be applied to arguments
;  given: 2
;  context...:
;   body of "c:\Users\micah\OneDrive\Documents\TYCS\SICP\Chapter 1\Exercise 1.34.rkt"

; The reason for this is that scheme is expecting the first argument in the () to be a procedure that can be applied to the second argument;
; However, when (f f) is expanded, you end up with (2 2) and the integer 2 is not a valid procedure
(f f)