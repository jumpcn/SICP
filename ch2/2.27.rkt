#lang racket


(define (deep-reverse x)
  (cond ((null? x) empty)
        ((not (pair? x)) x)
        (else
         (append (deep-reverse (cdr x))
                 (list (deep-reverse (car x)))))))

(define x (list 1 (list 1 2) 5 9 (list 3 4)))
(deep-reverse x)
(deep-reverse empty)