; We need to apply the orignal procedure two times
; For example I pass (double inc), then I need it to return (inc (inc a))

(define (double f)
    (lambda (x)
    (f (f x))
    )
)

(define (inc a)
    (+ a 1))

(display(((double (double double)) inc) 5))

; The procedure returns 21
; This is because double is doubled, making that a x4 multiplier
; that is then applied to itself, we apply the x4 multiplier twice, making it a x16 multiplier
; that is then applied to inc, making it increment 16 times