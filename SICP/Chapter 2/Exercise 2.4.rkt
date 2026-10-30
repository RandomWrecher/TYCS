#lang sicp

(define (cons x y) 
  (lambda (m) (m x y)))

(define (car z) 
  (z (lambda (p q) p)))

(define (cdr z)
    (z (lambda (p q) q)))

(define pair (cons 1 0))
(display (cdr pair))
(newline)
(display (car pair))

; Starting with :
(car (cons x y))

; Substitute what is returned from cons into car:
(car (lambda (m) (m x y)))

; Now substitute what is returned from car, keeping the cons procedure
((lambda (m) (m x y)) (lambda (p q) p))

; Apply outer lambda, replacing m with inner lambda
((lambda (p q) p) x y)

; Apply inner lambda, replacing p with x and q with y
x

; Same process for cdr, but swap the p for q in inner lambda