(define (make-interval a b) (cons a b))

(define (upper-bound interval) (max (cdr interval) (car interval)))
(define (lower-bound interval) (min (cdr interval) (car interval)))

(define int (make-interval 1 10))
(define upper (upper-bound int))

(display upper)