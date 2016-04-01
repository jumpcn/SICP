#lang racket

(define (make-account balance set_password)

  (define try_time 0)
  (define (call_cop . args)
    (display "call cop...\n"))
  (define (show_wrong . args)
    (display "wrong password\n"))
           
  
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
        (begin (set! try_time 0)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknow request: MAKE-ACCOUNT" m))))
        (begin (set! try_time (+ 1 try_time))
               (if (>= try_time 7)
                   call_cop
                   show_wrong
                   ))))
                       
    dispatch)

(define acc (make-account 100 '11))

((acc '111 'withdraw) 40)
((acc '111 'withdraw) 40)
((acc '111 'withdraw) 40)
((acc '111 'withdraw) 40)
((acc '111 'withdraw) 40)
((acc '111 'withdraw) 40)
((acc '111 'withdraw) 40)
((acc '11 'deposit) 400)

