#lang scheme

(define (factorial-recur n)
  (if (= n 1)
      1
      (* n (factorial-recur (- n 1)))))

(define (factorial-iter n)
  (define (iter n product)
          (if (= n 1)
              product
              (iter (- n 1) (* product n))))
  (iter n 1))

#! 书上的迭代实现，难道 n 是不变量？
(define (factorial n)
  (define (iter product counter max)
    (if (> counter max)
        product
        (iter (* product counter) (+ counter 1) max)))
  (iter 1 1 n))

(define n 3)
(factorial-recur n)
(factorial-iter n)
(factorial n)