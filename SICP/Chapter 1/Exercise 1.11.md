`f(n) = n` if `n < 3`

`f(n) = f(n -1) + 2f(n -2) + 3f(n -3)` if `n >= 3`

**Recursive process**
```scheme
(define (func n)
    (if (< n 3)
        n
        (+ (func (- n 1)
            (* (func (- n 2)) 2)
            (* (func (- n 3)) 3)))))
```

**Iterative process**
```scheme
(define (func n)
    (if (< n 3)
        n
        (func-iter 2 1 0 (- n 2))))

(define (func-iter a b c count)
    (if (= count 0)
        a
        (func-iter (+ a (* 2 b) (* 3 c))
            a
            b
            (- count 1))))
```