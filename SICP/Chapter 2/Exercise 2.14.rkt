(define (add-interval x y)
  (make-interval (+ (lower-bound x) 
                    (lower-bound y))
                 (+ (upper-bound x) 
                    (upper-bound y))))

(define (make-interval a b) (cons a b))

(define (upper-bound interval) (max (cdr interval) (car interval)))
(define (lower-bound interval) (min (cdr interval) (car interval)))

(define (div-interval x y)
  (mul-interval x 
                (make-interval 
                 (/ 1.0 (upper-bound y)) 
                 (/ 1.0 (lower-bound y)))))

(define (center i)
  (/ (+ (lower-bound i) 
        (upper-bound i)) 
     2))

(define (width i)
  (/ (- (upper-bound i) 
        (lower-bound i)) 
     2))

(define (make-center-percent cent percent)
    (make-interval (- cent (* (/ percent 100.0) cent)) (+ cent (* (/ percent 100.0) cent))))

(define (percent interval)
    (* (/ (- (upper-bound interval) (center interval)) (center interval)) 100))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) 
               (lower-bound y)))
        (p2 (* (lower-bound x) 
               (upper-bound y)))
        (p3 (* (upper-bound x) 
               (lower-bound y)))
        (p4 (* (upper-bound x) 
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (par1 r1 r2)
  (div-interval 
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval 
     one
     (add-interval 
      (div-interval one r1) 
      (div-interval one r2)))))

(define (display-interval-percent i)
    (display (center i))
    (display " +- ")
    (display (percent i))
    (display "%")
    (newline))

(define A (make-center-percent 100 1.0))
(define B (make-center-percent 200 2.0))

(display "A / A: ")
(display-interval-percent (div-interval A A))

(display "B / B: ")
(display-interval-percent (div-interval B B))

(display "A / B: ")
(display-interval-percent (div-interval A B))

(display "par1(A, B): ")
(display-interval-percent (par1 A B))

(display "par2(A, B): ")
(display-interval-percent (par2 A B))

; Conclusion:
; A / A should equal exactly [1,1] (1 +- 0%)
; however in this system, A/A has a tolerance of 2%, meaning uncertainty doubled
; This is because div-interval cannot know the num and denom refer to the same pyhsical resistor
; They are treated as two separate quantities that can vary independently within [99,101]
; Lem is right that par2 is better
; in par1 R1 and R2 each appear twice, causing the system to compound phantom errors
; in par2 R1 and R2 each appear only once, keeping the bound as small as possible for the phantom errors