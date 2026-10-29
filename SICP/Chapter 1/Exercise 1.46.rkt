(define (iterative-improve check improve)
    (define (iter guess)
        (if (check guess)
            guess
            (iter (improve guess))))
    iter)

; Writing sqrt with iterative improve

(define (square x)
    (* x x))

(define (average x y)
    (/ (+ x y) 2.0))

(define (sqrt x)
    ((iterative-improve (lambda (guess) (< (abs (- (square guess) x)) 0.001)) (lambda (guess) (average guess (/ x guess)))) 1.0))

(display (sqrt 16))
(newline)

; Writing fixed-point with iterative improve

(define (fixed-point f first-guess)
    ((iterative-improve (lambda (guess) (< (abs (- guess (f guess))) 0.00001)) f) first-guess))

(display (fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0))