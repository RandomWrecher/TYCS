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

(define (branch-torque branch)
    (* (total-weight (branch-structure branch)) (branch-length branch)))

; My solution that I came up with
(define (balanced mobile)
    (cond ((null? mobile) #t)
          ((and (not (pair? (branch-structure (left-branch mobile))))  (pair? (branch-structure (right-branch mobile))))
                (and (= (branch-torque (left-branch mobile)) (branch-torque (right-branch mobile)))
                     (balanced (branch-structure (right-branch mobile)))))
          ((and (pair? (branch-structure (left-branch mobile)))  (not (pair? (branch-structure (right-branch mobile)))))
                (and (= (branch-torque (left-branch mobile)) (branch-torque (right-branch mobile)))
                     (balanced (branch-structure (left-branch mobile)))))
          ((and (pair? (branch-structure (left-branch mobile))) (pair? (branch-structure (right-branch mobile))))
                (and (balanced (branch-structure (right-branch mobile)))
                     (balanced (branch-structure (left-branch mobile)))))
          (else (= (branch-torque (left-branch mobile)) (branch-torque (right-branch mobile))))))

; A slightly more elegant solution is as follows:
(define (balanced-better mobile)
    (if (not (pair? mobile))
        #t
        (and (= (branch-torque (left-branch mobile))
                (branch-torque (right-branch mobile)))
            (balanced-better (branch-structure (left-branch mobile)))
            (balanced-better (branch-structure (right-branch mobile))))))

(define left (make-branch 4 5))
(define right (make-branch 10 2))
(define test (make-mobile left right))

(define submobile (make-mobile (make-branch 2 3)
                                (make-branch 2 3)))
(define mainmobile (make-mobile (make-branch 5 submobile)
                                (make-branch 10 3)))
(display (balanced mainmobile))

; If the constructors are changed to use cons instead of list, all I have to change is
(define (branch-structure branch)
    (cdr branch))

(define (right-branch mobile)
    (cdr mobile))