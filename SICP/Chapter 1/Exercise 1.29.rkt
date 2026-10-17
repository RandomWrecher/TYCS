#lang sicp
; y_k = f(a + kh)
; h = (b - a)/n for an even integer n
; h/3 (y_0 + 4y_1 + 2y_2 + ... + 2y_n-2 + 4y_n-1 + y_n)

(define (simpsons f a b n)
    ; Define h, which is a constant
    (define h (/ (- b a) n))

    ; Define y, which doesn't change with k
    (define (y k)
        (f (+ a (* k h))))

    ; Define the multiplier for y(k)
    (define (y_k k)
        (cond ((or (= k 0) (= k n)) (* 1 (y k)))
        ((even? k) (* 2 (y k)))
        (else (* 4 (y k)))))
    
    ; Kick off the summation
    (* (sum y_k 0 inc n) (/ h 3)))

; Simple incrementation procedure
(define (inc n) (+ n 1))

; Cube procedure
(define (cube x) (* x x x))

; Summation procedure
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))


; Need an alogrithm/formula for capturing the 1 4 2 ... 2 4 1
; pattern found in the approximation
; if k = 0, then 1*y_k. If k = n, then 1 * y_k
; if k is odd, then 4 * y_k. if k is even then 2 * y_k.

; Test against requirements
(simpsons cube 0 1 1000)

; for n=100, returns 1/4
; for n=1000, returns 1/4
; Correct behavior!