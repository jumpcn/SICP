#lang racket

(define (accumulate op init items)
  (if (null? items)
      init
      (op (car items)
          (accumulate op init (cdr items)))))


(define (map op items)
  (if (null? items)
      null
      (cons (op (car items))
            (map op (cdr items)))))


(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x)
                     (if (not (pair? x)) 1
                         (count-leaves x))) t)))
              
                         
(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)
(count-leaves (list x x))
