; Original fast-expt procedure
(define (fast-expt b n)
  (cond ((= n 0) 
         1)
        ((even? n) 
         (square (fast-expt b (/ n 2))))
        (else 
         (* b (fast-expt b (- n 1))))))

; Original expmod procedure
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

; Proposed new expmod procedure
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; The proposed new procedure for expmod will work, but it will be much slower than the original expmod.
; The reason for this is because the new expmod requires the base to be fully exponentiated before
; taking the remainder against the m variable.
; This allows that intermediate number (base^exp) to grow unbounded.
; With the original, because the remainder is being taken at each step, the intermediate number never grows
; larger than m^2.
; For example with 3^8 mod(7) with the original, the largest intermediate number is 16, but with the
; new version the largest intermediate number is 6561. Taking that logic to much larger numbers and exponents
; would cause a drastic decrease in performance and would definitely not beat the O(log(exp)) because it
; would operate in O(exp^2)
