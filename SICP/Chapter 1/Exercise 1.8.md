```scheme
(define (cubert-iter guess prev-guess x)
    (if (good-enough? guess prev-guess)
        guess
        (cubert-iter (improve guess x) guess x)))

(define (good-enough? guess prev-guess)
    (<
        abs(- guess prev-guess)
        (*guess 0.0001)))

(define (improve guess x)
    (/
        (+
            (/
                x
                (square guess))
            (* 2 guess))
        3))

(define (cubert x)
    (cubert-iter 1.0 0.0 x))
```