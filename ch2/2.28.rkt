#lang racket

(define x (list (list 1 2) (list 3 4)))

(define (fringe x)
  (cond ((null? (cdr x))
         (if (pair? (car x))
             (fringe (car x))
             x))
        ((not (pair? (car x)))
         (cons (car x) (fringe (cdr x))))
        (else (append (fringe (car x)) (fringe (cdr x))))))


(fringe x)
(fringe (list x x))