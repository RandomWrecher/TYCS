(define (subsets s)
    (if (null? s)
        (list '())
        (let ((rest (subsets (cdr s))))
            (append rest (map (lambda (sub) (cons (car s) sub)) rest)))))

(display (subsets (list 1 2 3)))