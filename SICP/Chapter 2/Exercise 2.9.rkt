(define (make-interval a b) (cons a b))

(define (upper-bound interval) (max (cdr interval) (car interval)))
(define (lower-bound interval) (min (cdr interval) (car interval)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) 
                    (lower-bound y))
                 (+ (upper-bound x) 
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) 
               (lower-bound y)))
        (p2 (* (lower-bound x) 
               (upper-bound y)))
        (p3 (* (upper-bound x) 
               (lower-bound y)))
        (p4 (* (upper-bound x) 
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (width interval)
    (/ (- (upper-bound interval)
          (lower-bound interval)) 2.0))

(define int (make-interval 1 10))
(define int2 (make-interval 2 8))
(define intwidth (width int))
(define int2width (width int2))

; If two intervals are defined as x = a,b and y = c,d
; Then adding the two x + y = [a+c, b+d]
; Then calculating the width of the sum is:
; (b + d) - (a + c) / 2 = (b - a) + (d - c) / 2 = (b - a) / 2 + (d -c) / 2
; This shows that the width of the sum is only dependent on the widths of the intervals added

; When multiplying: if A = [0,2] with a width of 1 and B = [0,2] with a width of 1
; Then A x B = [0,4] with a width of 2
; BUT, if C = [10,12] with a width of 1 and D = [10,12] with a width of 1
; Then C x D = [100,144] with a width of 22

(define added (add-interval int int2))
(define mult (mul-interval int int2))
(define addedwidth (width added))
(define multwidth (width mult))
(display intwidth)
(newline)
(display int2width)
(newline)
(display addedwidth)
(newline)
(display multwidth)