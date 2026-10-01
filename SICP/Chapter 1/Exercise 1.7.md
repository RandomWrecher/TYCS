* For numbers smaller than the tolerance value of 0.001, the test breaks down
```scheme
(define (good-enough? old-guess new-guess)
    (< 
        (/ 
            abs(- old-guess new-guess) 
            old-guess) 
        0.00001)
)
```
* This strategy checks how much guess changes and when that change is below 0.00001 then the procedure stops. It ensures that the solution will converge and not get stuck oscillating around an answer or get a completely wrong answer