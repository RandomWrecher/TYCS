#lang sicp

(define (make-point x y)
    (cons x y))

(define (x-point point)
    (car point))

(define (y-point point)
    (cdr point))

(define (make-segment start end)
    (cons start end))

(define (start-segment segment)
    (car segment))

(define (end-segment segment)
    (cdr segment))

(define (midpoint-segment segment)
    (make-point
    (/ (+ (x-point (start-segment segment)) (x-point (end-segment segment))) 2)
    (/ (+ (y-point (start-segment segment)) (y-point (end-segment segment))) 2)
    ))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define point1 (make-point 1 1))
(define point2 (make-point 3 1))
(define segment1 (make-segment point1 point2))
(define midpoint (midpoint-segment segment1))

(print-point midpoint)
