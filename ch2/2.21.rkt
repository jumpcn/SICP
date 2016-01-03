#lang racket

(define (square-list items)
  (if (null? items)
      '()
      (cons ((lambda (n) (* n n)) (car items)) (square-list (cdr items)))))
(square-list (list 1 2 3 4))
