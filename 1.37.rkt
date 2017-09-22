#lang scheme

#! 我自己想的递归版本
(define (cont-frac n d k)
  (define (iter counter)
    (if (= counter k)
        (/ (n counter) (d counter))
        (/ (n counter) (+ (d counter) (iter (+ counter 1))))))
  (iter 1))

#! 别人想的，简单到，简直就是函数的直译
#! 理清 f(n) = (/ n (+ d f(- n 1))) 就能直译递归了
(define (cont-frac-recur n d k)
  (if (= k 0)
      0
      (/ (n k) (+ (d k) (cont-frac-recur n d (- k 1))))))


#! 我本以为是没有迭代版本的，没想到真的有。看来有递归必有迭代
(define (cont-frac-iter n d k)
  (define (iter k product)
    (if (= 0 k)
        product
        (iter (- k 1) (/ (n k) (+ (d k) product)))))
  (iter k 0))

(define n 1000)

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) n)
(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) n)
(cont-frac-recur (lambda (i) 1.0) (lambda (i) 1.0) n)
