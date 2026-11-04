(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        (reverse answer)
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

(define (reverse items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (car things) answer))))
  (iter items '()))

; This produces the answer list reversed because
; you are adding the square of the car to the left of the answer list

(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items '()))

; This gets close but doesn't return a correct list
; because you are consing a single number to the answer list
; Key point is that the car of a list should be an element (integer) and the cdr should be a sublist of remaining elements or '()
; This one puts the '() or (() .1) in the car and the element in the cdr

; To fix the code and make it work, you must call an interative reverse procedure on the final answer

(display (square-list (list 1 2 3 4 5)))