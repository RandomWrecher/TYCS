#lang sicp
;Miller-Rabin Test
; if n is prime and a is any positive int < n, then a^(n-1) is congruent to 1 modulo n
; to test primality of number n
; pick random number a < n
; raise a^(n-1) modulo n (use expmod)
; During squaring step in expmod, check for "nontrivial square root of 1 modulo n"
; that is, number != 1 or n-1 whose square = 1 modulo n
; Modify expmod 

; What is confusing:
; How to check a number not equal to 1 or n-1 with its square = 1 mod n

(define (square n)
    (* n n))

(define (nontriv-check x m) ; This procedure is how it works
    (if (and (not (= x 1)) ; checking the result is != 1
             (not (= x (- m 1))) ; checking the result is != n-1
             (= (remainder (square x) m) 1)) ; checking the result^2 mod n = 1
        0 ; Then it is prime, return 0
        (remainder (square x) m))) ; otherwise compute the normal square

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (nontriv-check (expmod base (/ exp 2) m) m)); the normal square step gets replaced with this procedure
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

(define (mr-test n)
    (define (test-it a)
        (= (expmod a (- n 1) n) 1)) ; here we check if a^n-1 mod n = 1
    (test-it (+ 1 (random (- n 1))))) ; taking a random a between 1 and n-1

(define (mr-prime? n times)
    (cond ((= times 0) true) ; if we pass all the tests, then the number is prime
          ((mr-test n) ; if the test passes, then repeat the procedure, but decrement the times by 1
           (mr-prime? n (- times 1)))
          (else false))) ; if times > 0 and the test fails, then the number is not prime

(mr-prime? 13 10)