#lang racket

(define (make-monitored op)
  (let ((cnt 0))
    (lambda (f)
      (cond ((eq? f 'how-many-calls?)
            cnt)
            ((eq? f 'reset-count)
             (begin (set! cnt 0) cnt))
            (else (begin (set! cnt (+ 1 cnt)) (op f))))
            )))
            

(define s (make-monitored sqrt)) (s 100)
(s 'how-many-calls?)
