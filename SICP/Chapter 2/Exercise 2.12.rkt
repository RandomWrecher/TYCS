(define (make-interval a b) (cons a b))

(define (upper-bound interval) (max (cdr interval) (car interval)))
(define (lower-bound interval) (min (cdr interval) (car interval)))

(define (center i)
  (/ (+ (lower-bound i) 
        (upper-bound i)) 
     2))

(define (width i)
  (/ (- (upper-bound i) 
        (lower-bound i)) 
     2))

(define (make-center-percent cent percent)
    (make-interval (- cent (* (/ percent 100.0) cent)) (+ cent (* (/ percent 100.0) cent))))

(define (percent interval)
    (* (/ (- (upper-bound interval) (center interval)) (center interval)) 100))

(define int (make-center-percent 3 50))
(define percents (percent int))
(display int)
(newline)
(display percents)

