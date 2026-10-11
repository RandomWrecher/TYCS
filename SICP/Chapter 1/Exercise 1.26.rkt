; Original expmod
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

; Modified expmod
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (* (expmod base (/ exp 2) m)
             (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base 
             (expmod base (- exp 1) m))
          m))))

; Claim that by rewriting it, it went from O(log n) to O(n)
; The reason for this is because when explicit multiplication is used
; then the expmod procedure gets called twice instead of being called once
; and then its result being passed to the square procedure
; This gets rid of the efficiency gained in the first place by transforming the original version
; from a recursion tree with a single chain of depth log2n, requiring O(log n) steps.
; Into a binary tree of depth log2n with 2n - 1 nodes, a  O(n) process