#lang racket

(provide accumulate random-in-range monte-carlo square)

(define (square x)
  (* x x))
(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
            (accumulate op init (cdr seq)))))

(define (random-in-range low high)
  (let ((range (- high low)))
      (+ low (* (random) range))))

(define (monte-carlo trails exp)
  (define (iter trails-rem trails-passed)
    (cond ((= trails-rem 0)
           (/ trails-passed trails))
          ((exp)
           (iter (- trails-rem 1) (+ trails-passed 1)))
          (else
           (iter (- trails-rem 1) trails-passed))))
  (iter trails 0))

