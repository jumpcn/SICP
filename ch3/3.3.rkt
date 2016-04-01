#lang racket

(define (make-account balance set_password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (verify_password given)
    (eq? given set_password))

  (define (dispatch pass m)
    (if (verify_password pass)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknow request: MAKE-ACCOUNT")))
        (display "wrong password")))
                       
    dispatch)

(define acc (make-account 100 '11))

((acc '11 'withdraw) 40)
((acc '11 'deposit) 400)
((acc '111 'deposit) 400)
