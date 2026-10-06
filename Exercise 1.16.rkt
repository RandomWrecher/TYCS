#lang sicp
(define (expt b n)
    (iter-expt 1 b n))

(define (even? n)
    (= (remainder n 2) 0))

(define (iter-expt a b n)
    (cond ((= n 0)
            a)
             ((even? n)
             (iter-expt a (* b b) (/ n 2)))
             (else 
                (iter-expt (* a b) b (- n 1)))) )

(expt 2 5)