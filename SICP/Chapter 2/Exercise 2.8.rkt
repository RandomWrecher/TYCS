(define (make-interval a b) (cons a b))

(define (upper-bound interval) (max (cdr interval) (car interval)))
(define (lower-bound interval) (min (cdr interval) (car interval)))

(define (sub-interval x y)
    (make-interval (- (lower-bound x)
                      (upper-bound y))
                   (- (upper-bound x)
                      (lower-bound y))))

(define int1 (make-interval 1 10))
(define int2 (make-interval 3 8))

(define subs (sub-interval int1 int2))
(display subs)