#lang racket
(define (gcd a b)
  (cond ((= b 0) a)
      (else (gcd b (modulo a b)))))

;(power a b) means a^b
(define (power a b)
  (cond ((= b 0) 1)
        ((= b 1) a)
        ((= 1 (modulo b 2)) (* a (power a (- b 1))))
        ((* (power a (/ b 2)) (power a (/ b 2))))))

;new-cond makes 2^a * 3^b
(define (new-cons a b)
  (* (power 2 a) (power 3 b)))

(define (get-power a b)
  (cond ((= 1 (gcd a b)) 0)
        (else (+ 1 (get-power (/ a b) b)))))


(define (new-car a)
  (get-power a 2))

(define (new-cdr a)
  (get-power a 3))

(new-cons 5 4)
(new-car (new-cons 5 4))
(new-cdr (new-cons 5 4))

(new-cons 1 3)
(new-car (new-cons 1 3))
(new-cdr (new-cons 1 3))

(new-cons 0 3)
(new-car (new-cons 0 3))
(new-cdr (new-cons 0 3))


      



