#lang sicp

; Carmichael numbers 561, 1105, 1729, 2465, 2821, 6601
(define (square n)
    (* n n))

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

(define (fermat-iter n)
    (define (iter a)
        (cond ((= a n) true)
            ((= (expmod a n n) a) (iter (+ a 1)) )
            (else false)))
    (iter 1))

(fermat-iter 13)