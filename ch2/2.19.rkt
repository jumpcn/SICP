#lang racket

(define (cc amount coin-values)
  (cond ((= amout 0) 1)
        ((or (< amout 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (expect-first-denomation coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (no-more? coin-values)
  (null? coin-values))

(define (first-denomination )
  (car a))
(define (expect-first-denomination a)
  (cdr a))

(define us-coins (list 50 25 10 5 1))
  
(count-change 100)