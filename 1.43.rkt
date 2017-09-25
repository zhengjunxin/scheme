#lang scheme

(define (compose f g)
  (lambda (i) (f (g i))))

(define (square n) (* n n))
(define (inc n) (+ n 1))

#! 内部定义 iter 的 repeated
(define (repeated f time)
  (lambda (n) (define (iter counter) (if (= counter 1)
                                         (f n)
                                         (f (iter (- counter 1)))))
    (iter time)))

#! 自我递归的 repeated
(define (repeated-iter f time)
  (lambda (n) (if (= time 1)
                  (f n)
                  (f ((repeated-iter f (- time 1)) n)))))

#! 使用 compose 的 repeated
(define (repeated-compose f time)
  (if (= time 1)
      (lambda (n) (f n))
      (compose f (repeated-compose f (- time 1)))))

(define dx 0.001)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3)))

(define (repeat-smooth time) (repeated smooth time))

((smooth square) 5)