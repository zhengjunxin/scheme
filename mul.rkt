#lang scheme

(define (double a) (+ a a))

(define (halve a) (/ a 2))

#! 递归线性步求乘积
(define (mul a b)
  (if (= b 1)
      a
      (+ a (mul a (- b 1)))))

#! 递归对数步求乘积
(define (fast-mul a b)
  (cond ((= b 1) a)
        ((even? b) (fast-mul (double a) (halve b)))
        (else (+ a (fast-mul a (- b 1))))))

#! 迭代线性步求乘积
(define (mul-iter a b)
  (define (iter a b product)
    (if (= b 0)
      product
      (iter a (- b 1) (+ product a))))
  (iter a b 0))

#! 迭代对数步求乘积，我是根据线性步推导出来的！
(define (fast-mul-iter a b)
  (define (iter a b product)
    (cond ((= b 0) product)
          ((even? b) (fast-mul-iter (double a) (halve b)))
          (else (+ a (fast-mul-iter a (- b 1))))))
  (iter a b 0))

(define a 4)
(define b 4)

(mul a b)
(fast-mul a b)
(mul-iter a b)
(fast-mul-iter a b)
