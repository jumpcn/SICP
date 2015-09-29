#lang racket


(define (reverse l)
  (if (null? l)
      '()
      (append (reverse (cdr l)) (list (car l)))))

(reverse '())
(reverse '(1 2 3 4))