; Need to check what the parity of the first in the list list
; should just be parity = first mod 2

; If an single item list if passed, return that item list
; Then for each succesive argument check if its parity matches parity
; If it does match then append it to the returned list (which starts with the first item)

(define (same-parity first . rest)
    (let ((parity (remainder first 2)))
        (define (filter items)
            (cond ((null? items)
                  '())
                  ((= (remainder (car items) 2) parity)
                   (cons (car items) (filter (cdr items))))
                  (else (filter (cdr items)))))
        (cons first (filter rest))))

(display (same-parity 2 2 3 4 5 6 7))