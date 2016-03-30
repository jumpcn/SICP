#lang racket
(require "../module/common.rkt")
(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter init seq))

(define fold-right accumulate)
(fold-left / 1 (list 1 2 3))

(fold-right / 1 (list 1 2 3))
(fold-right list null (list 1 2 3))
(fold-left list null (list 1 2 3))

;exercise

(define (reverse seq)
  (fold-right (lambda (x y)
                (append y (list x)))  
              null seq))

(define (reverse1 seq)
  (fold-left (lambda (x y)
               (cons y x))
             null seq))
(reverse1 (list 3 2 1))
(reverse1 (list 1 2 3))
                      