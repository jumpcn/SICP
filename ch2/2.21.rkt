#lang racket

(define (square-list items)
  (if (empty? items)
      null
      (cons (* (car items) (car items))
            (square-list (cdr items)))))

(square-list (list 1 2 3 4))
