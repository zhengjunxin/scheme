#lang scheme

(define (exp-recur b n)
  (if (= n 0)
      1
      ()))

#! 阶乘的对数步递归
(define (exp b n)
  (cond ((= n 0) 1)
        ((even? n) (* (exp b (/ n 2))
                      (exp b (/ n 2))))
        (else (* b
                 (exp b (- n 1))))))



(define (exp-iter b n) (iter b n 1))

(define (iter b a product)
  (if (= 0 a)
      product
      (iter b (- a 1) (* product b))))


(define number 2)
(exp 2 number)
(exp-iter 2 number)