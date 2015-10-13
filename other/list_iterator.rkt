#lang racket

(define L (list 1 2 (list 3 4 5 (list 6 7 8)) 9))

(define (iter x)
  (cond [(null? x) 0]
        [(not (pair? x)) x]
        [else (+ (iter (car x))
                 (iter (cdr x)))]))

(iter L)