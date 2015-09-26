#lang racket
(define (gcd a b)
  (cond [(= b 0) a]
        [else (gcd b (modulo a b))]))


(gcd 7 4)
