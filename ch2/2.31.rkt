#tree-map 
#lang racket


(define (map op items)
  (if (null? items)
      null
      (cons (op (car items))
            (map op (cdr items)))))

(define (square x)
  (* x x))

(define (tree-map op tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (tree-map op subtree)
             (op subtree)))
       tree))


(define (square-tree tree)
  (tree-map square tree))

(square-tree (list 2 3 4 (list 3 4 5) (list 9)))
