(define (compose f g)
    (lambda (x)
    (f (g x))))

(define (square x)
    (* x x))

(define (repeated f n)
    (define (recurs i func)
        (if (= i n)
            func
            (recurs (+ i 1) (compose f func))))
    (recurs 1 f))

(display ((repeated square 2) 5))