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

(define (make-rectangle top side)
    (cons top side))

(define (make-rectangle2 origin w h)
    (cons origin (cons w h)))

(define (rect-width2 rect)
    (car (cdr rect)))

(define (rect-height2 rect)
    (cdr (cdr rect)))

(define (rect-top r)
    (car r))

(define (rect-side r)
    (cdr r))

(define (rect-width r)
    (let ((seg (rect-top r)))
        (abs (- (x-point (end-segment seg))
                (x-point (start-segment seg))))))

(define (rect-height r)
    (let ((seg (rect-side r)))
        (abs (- (y-point (end-segment seg))
                (y-point (start-segment seg))))))

(define (perimeter rectangle)
    (* 2 (+ (rect-width rectangle) (rect-height rectangle))))

(define (area rectangle)
    (* (rect-width rectangle) (rect-height rectangle)))

(define (perimeter2 rectangle)
    (* 2 (+ (rect-width2 rectangle) (rect-height2 rectangle))))

(define (area2 rectangle)
    (* (rect-width2 rectangle) (rect-height2 rectangle)))

(define point1 (make-point 1 1))
(define point2 (make-point 3 1))
(define point3 (make-point 3 0))
(define top (make-segment point1 point2))
(define side (make-segment point2 point3))
(define rectangle (make-rectangle top side))
(define rect2 (make-rectangle2 point1 3 4))
(define perim (perimeter rectangle))
(define perim2 (perimeter2 rect2))
(define A (area rectangle))
(define A2 (area2 rect2))

(display perim)
(newline)
(display A)
(newline)
(display "Rectangle 2")
(newline)
(display perim2)
(newline)
(display A2)