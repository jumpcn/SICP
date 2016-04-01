#lang racket

(define (make-accumulator f)
  (let ((d f))
  (lambda (f)
    (begin (set! d (+ f d)) (+ d)))))

(define A (make-accumulator 5))

(A 10)
(A 10)