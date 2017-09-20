#lang scheme

(define (max-sum x y z)
  (cond ((and (<= x y) (<= x z)) (+ y z))
        ((and (<= y z) (<= y x)) (+ x z))
        (else (+ x y))))

(max-sum 1 2 3)
