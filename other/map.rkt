#lang racket


(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))


(map (lambda (x) (cons x (* x x))) (list 2 3 4 5))

