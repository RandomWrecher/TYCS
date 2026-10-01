```scheme
(define (p) (p))
(define (test x y)
    (if (= x 0) 0 y))
(test 0 (p))
```
**Applicative Order**
* `(test 0 (p))` must resolve all arguments before passing to procedure
* `(p)` recursively calls itself and the procedure never runs

**Normal Order**
* `(test 0 (p))` agruments stay untouched until necessary to use them 
* `(if (= x 0) 0 y)` -> `(if (= 0 0) 0 (p))` -> `(= 0 0)` is true so 0 is returned `(p)` never gets evaluated 