#lang racket
(define (map op items)
  (if (null? items)
      null
      (cons (op (car items))
            (map op (cdr items)))))


(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (n)
                            (cons (car s) n))
                            rest)))))


(subsets (list 1 2 3))
