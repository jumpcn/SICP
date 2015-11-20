#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))


; a)
; cadr 是 car 和 cdr 的组合，比如(cadr (list 1 2)) = 2
(define left-branch car)
(define right-branch cadr)
(define branch-length car)
(define branch-structure cadr)


; b)

(define (total-weight m)
  (let ((bs-lb (branch-structure (left-branch m)))
        (bs-rb (branch-structure (right-branch m))))
    (cond [(and (pair? bs-lb) (pair? bs-rb))
           (+ (total-weight bs-lb) (total-weight bs-rb))]
          [(and (pair? bs-lb) ((not (pair? bs-rb))))
           (+ (total-weight bs-lb) bs-rb)]
          [(and (not (pair? bs-lb)) (pair? bs-rb))
           (+ bs-lb (total-weight bs-rb))]
          [else (+ bs-lb bs-rb)])))


; c)
;此函数用来获得当前子branch的weight

(define (branch-weight m)
  (if (pair? (branch-structure m))
      (total-weight (branch-struct m))
      (branch-structure branch)))

; Test Case:

(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))
(define b (make-mobile (make-branch 2 3) (make-branch 4 5)))
(total-weight a)
;Value: 6
(total-weight b)
;Value: 8
;创建个复杂的例子
(define c (make-mobile (make-branch 5 a) (make-branch 3 b)))
(total-weight c)
;Value: 14