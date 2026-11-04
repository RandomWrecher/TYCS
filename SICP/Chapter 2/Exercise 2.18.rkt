

; Need to get length of list?
; Need a way to get the last item in the list
; Once you have that, append the second to last item to item
; 
; This works to return the last item in a list (Essentially solving 2.17)
(define (last items)
    (if (null? (cdr items))
    (car items)
    (last (cdr items))))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) 
                (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

; Recursive form
(define (reverse arg)
    (if (null? arg)
    (list)
    (append (reverse (cdr arg)) (list (car arg)))))

; Iterative form
(define (reverse-iter arg)
    (define (iter arg newlist)
        (if (null? arg)
        newlist
        (iter (cdr arg) (cons (car arg) newlist))))
    (iter arg (list)))

(define itemss (list 0 1 2 3))
(display (reverse-iter itemss))