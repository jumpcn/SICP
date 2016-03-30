#lang racket
(require "2.36.rkt")
(define (map2 op seq1 seq2)
  (if (null? seq1)
      null
      (cons (op (car seq1) (car seq2))
         (map2 op (cdr seq1) (cdr seq2)))))

(define l (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))

(define (dot-product col v)
  (accumulate + 0 (map2 * col v)))

; test dot-product
(dot-product (list 1 2 3) (list 1 2 3))

(define (matrix-*-vector m v)
  (map (lambda (col)
         (dot-product col v))
       m))
; define transpose

(define (transpose m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (col-of-m)
           (map (lambda (col-of-cols)
                  (dot-product col-of-m
                               col-of-cols))
                cols))
         m)))

(matrix-*-matrix (list (list 1 2) (list 3 4)) (list (list 1 0) (list 0 1)))
