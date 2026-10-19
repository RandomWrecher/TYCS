#lang sicp

(define (square n)
    (* n n))

(define (prime? n)
  (define (find-divisor d)
    (cond ((> (* d d) n) n)
          ((= (remainder n d) 0) d)
          (else (find-divisor (+ d 1)))))
  (and (> n 1)
       (= n (find-divisor 2))))

; Modified accumulate procedure
(define (filtered-accumulate combiner null-value term a next b filter)
    (cond ((> a b)
        null-value)
        ((filter a)(combiner (term a)
                  (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (identity x) x)
(define (inc x) (+ x 1))

(define (sum-square-primes a b)
    (filtered-accumulate + 0 square a inc b prime?))

; Coprime check and product of numbers
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(define (gcd_check n)
    (define (coprime? a)
        (and (< a n) (= (gcd a n) 1)))
    (filtered-accumulate * 1 identity 1 inc n coprime?))

(gcd_check 10)