#lang racket

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (expect-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (no-more? coin-values)
  (null? coin-values))

(define (first-denomination a)
  (car a))
(define (expect-first-denomination a)
  (cdr a))

(define us-coins (list 50 25 10 5 1))
  
(cc 100 us-coins)