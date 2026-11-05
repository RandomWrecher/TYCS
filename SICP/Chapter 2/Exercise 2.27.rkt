(define (deep-reverse arg)
    (cond ((null? arg) (list))
    ((not (pair? arg)) arg)
    (else (append (deep-reverse (cdr arg)) (list (deep-reverse (car arg)))))))

(define x (list (list 1 2 3) (list 3 5 4)))

(display (deep-reverse x))