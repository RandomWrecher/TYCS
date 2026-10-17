#lang sicp
; We'll go with a recursive process first
(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a)
                  (accumulate combiner null-value term (next a) next b))))

(define (identity x) x)
(define (inc x) (+ x 1))

; Test cases, both are working as they should!
(accumulate + 0 identity 0 inc 5)
(accumulate * 1 identity 1 inc 5)