#lang racket

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))


(define (horner-eval x co-seq)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff
                   (* x
                      (horner-eval x (cdr co-seq))
                      )))
               0
               co-seq))

(horner-eval 2 (list 1 3 0 5 0 1))
(horner-eval 2 (list 1 1 1 1 1 1))
