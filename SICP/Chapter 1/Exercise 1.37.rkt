; k-term finite continued fraction
; Iterative procedure
(define (cont-frac n d k)
    (define (iter i result)
        (if (= i 0)
            (display result)
            (iter (- i 1)
                  (/ (n i) (+ (d i) result)))))
    (iter k 0))

; Recursive procedure
(define (cont-frac-recur n d k)
    (define (recurs i)
        (if (> i k)
            0
            (/ (n i) (+ (d i) (recurs (+ i 1))))))
    (recurs 1))

; The k-th fraction needs to be computed first, because otherwise the rest cannot be computed
; So if k = 3, we need to compute n_3/d_3 first
; that result is then added to d_2 and then n_2 over d_2 can be computed
; if k = 1, then compute n_1/d_1 and return the result
(display (cont-frac-recur (lambda (i) 1.0)
           (lambda (i) 1.0)
           150))