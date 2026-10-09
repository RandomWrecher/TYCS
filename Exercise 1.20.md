```scheme
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
```
with normal order (gcd 206 40) becomes

(gcd 206 40)
(gcd 40 
    (remainder 206 40)) -> b is evaluated for the if statement (1x remainder)
(gcd (remainder 206 40) 
     (remainder 40 
                (remainder 206 40))) -> b is evaluted for the if statement (2x remainder)
(gcd (remainder 
        40 
        (remainder 206 40)) 
    (remainder 
        (remainder 206 40) 
        (remainder 40 
                   (remainder 206 40)))) -> b is 4x remainder
(gcd (remainder 
        (remainder 206 40) 
        (remainder 40 
                   (remainder 206 40))) 
     (remainder 
        (remainder 40 
                   (remainder 206 40)) 
        (remainder (remainder 206 40) 
                   (remainder 40 
                              (remainder 206 40))))) -> b is 7x remainder and = 0 so then a is evaluated at 4x remainder
return 2
Total 18 remainder calls

with applicative order (gcd 206 40)  becomes

(gcd 206 40)
(gcd 40 (remainder 206 40)) 1x remainder call
(gcd 40 6)
(gcd 6 (remainder 40 6)) 1x remainder call
(gcd 6 4)
(gcd 4 (remainder 6 4)) 1x remainder call
(gcd 4 2)
(gcd 2 (remainder 4 2)) 1x remainder call
(gcd 2 0)
2
Total 4 remainder calls