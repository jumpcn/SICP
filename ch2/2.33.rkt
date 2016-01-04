#lang racket

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))

(define (map p seq)
  (accumulate (lambda (x y) (cons (p x) y)) null seq))

(define (ap seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length seq)
  (accumulate (lambda (x y)
                (+ (if (null? x)
                       0
                       1)
                   y))
                0 seq))

(length (list null))
(length (list 2 3 4))
(length (list 1 2 3 (list 4)))
(ap (list 1 2 3) (list 4 5 6))
(map (lambda (n) (* n 2)) (list 1 2 3 4))

