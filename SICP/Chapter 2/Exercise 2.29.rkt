#lang sicp
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
    (car mobile))

(define (right-branch mobile)
    (car (cdr mobile)))

(define (branch-length branch) 
    (car branch))

(define (branch-structure branch)
    (car (cdr branch)))

(define (total-weight mobile)
    (cond ((null? mobile) 0)
          ((not (pair? mobile)) mobile)
          (else (+ (total-weight (branch-structure (left-branch mobile))) (total-weight (branch-structure (right-branch mobile)))))))

(define (balanced mobile)
    (cond ((null? mobile) #t)
          ))

(define left (make-branch 3 5))
(define right (make-branch 4 9))
(define test (make-mobile left right))

(define submobile (make-mobile (make-branch 2 3)
                                (make-branch 2 3)))
(define mainmobile (make-mobile (make-branch 5 submobile)
                                (make-branch 10 4)))
(display (total-weight mainmobile))