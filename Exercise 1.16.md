given b, n, a

if base = 2 n = 5

b^n = 2^5 = 32

b^0 = 1

```scheme
(define (expt b n)
    (iter-expt 1 b n))

(define (iter-expt a b n)
    (cond ((= n 0)
            1)
            ((= n 2)
             (* b b a))
             (even? n)
             (iter-expt a (* b b) (/ n 2))) )
```


if n%2 = 0 , then call with b*b=b and n=n/2 and a = a

if n=2, return b*b and stop iterating

1 * 2^5 => return 2 -- a = 1, b = 2, n =5

2 * 4^2 => return 4 -- a = 2, b = 2, n = 4

4 * 2^3 => return 8

8 * 2^2 => return 16

16 * 2^1 => return 16

32 * 2^0 => return 32
