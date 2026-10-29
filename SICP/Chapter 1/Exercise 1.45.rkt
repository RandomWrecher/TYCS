(define (repeated f n)
    (define (recurs i func)
        (if (= i n)
            func
            (recurs (+ i 1) (compose f func))))
    (recurs 1 f))

(define (compose f g)
    (lambda (x)
    (f (g x))))

(define (average-damp f)
  (lambda (x) 
    (average x (f x))))

(define (average x y)
    (/ (+ x y) 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (square x)
    (* x x))

(define (nth-root x n)
    (if (= n 1)
        x
        (fixed-point ((repeated average-damp (floor (/ (log n) (log 2))))
                    (lambda (y) (/ x (expt y (- n 1)))))
                    1.0)))

(display (nth-root 4 8))
