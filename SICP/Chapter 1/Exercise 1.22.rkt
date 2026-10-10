#lang sicp

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

(define (square n)
    (* n n))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime)
                          start-time))))

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes min count goal)
    (cond ((= count goal) (display "DONE"))
    ((= (remainder min 2) 0) (search-for-primes (+ min 1) count goal))
    ((prime? min) (timed-prime-test min)
                    (search-for-primes (+ min 2) (+ count 1) goal))
    (else (search-for-primes (+ min 2) count goal))))

(search-for-primes 100000000000 0 3)

; running this test with min = 1,000; 10,000; 100,000; 1,000,000 did not return anything of significance
; because it appears that it processes too fast.
; However, running it with 10,000,000,000; 100,000,000,000 and 1,000,000,000,000 does showcase the O(sqrt(10))
; growth of computing time 