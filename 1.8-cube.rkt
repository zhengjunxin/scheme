#lang scheme

(define (cube-iter y x)
  (if (good? y x)
      y
      (cube-iter (improve y x) x)))


(define (improve y x) (/ (+ (/ x (* y y)) (* 2 y)) 3))

(define (good? y x)
  (< (abs (- (* y y y) x)) 0.001))

(define (cube x) (cube-iter 1.0 x))


(cube 8)
