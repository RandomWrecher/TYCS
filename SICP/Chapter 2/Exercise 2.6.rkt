; one
(define one (lambda (f)
    (lambda (x) (f x))))

; two
(define two (lambda (f)
    (lambda (x) (f (f x)))))

; defining addition
(define (+ a b) (lambda (f)
    (lambda (x) ((a f) ((b f) x)))))