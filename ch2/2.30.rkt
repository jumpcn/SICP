#lang racket

(define (square x)
  (* x x))

(define (map op items)
  (if null? items)
  null
  (cons (op (car items))
        (map op (cdr items))))

(define (square-tree tree)
  (cond
    ((null? tree) '())
    ((not (pair? (car tree)))
      (cons (square (car tree))
            (square-tree (cdr tree))))
    (else
      (cons (square-tree (car tree))
            (square-tree (cdr tree))))))

(square-tree (list 1 2 3 (list 2 3 4)))