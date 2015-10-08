#lang racket

(define for-each (lambda (go l)
                   (cond
                     [(not (null? l))
                      (begin (go (car l))
                             (for-each go (cdr l)))])))
                   
                   

(for-each (lambda (x) (newline) (display x))
         (list 57 231 88))

