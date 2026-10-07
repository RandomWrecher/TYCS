#lang sicp
(define (mult a b)
    (iter-mult a b 0))

(define (double a)
    (* a 2))

(define (halve a)
    (/ a 2))

(define (iter-mult a b sum)
    (cond ((= a 0)
            sum)
            ((= (remainder a 2) 0)
            (iter-mult (halve a) (double b) sum))
            (else
                (iter-mult (- a 1) b (+ sum b)))))
(mult 5 40)

If a is even, then a * b = a/2 * b*2
if a is odd, then a * b = (a -1) * b + b