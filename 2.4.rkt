#lang scheme

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 1 3))

#! 代换法分解的过程
(car (lambda (m) (m 1 3)))

((lambda (m) (m 1 3)) (lambda (p q) p))

((lambda (p q) p) 1 3)
