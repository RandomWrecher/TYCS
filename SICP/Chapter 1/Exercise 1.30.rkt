#lang sicp

; Need to transform sum from linear recursion
; into linear iteration

; Old linear recursion
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; New linear iteration
(define (sum-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ (term a) result))))
    (iter a 0))
(define (identity x) x)
(define (inc x) (+ x 1))

; Test case, and returns 15 as it should!
(sum-iter identity 0 inc 5)