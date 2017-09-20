#lang scheme

(define (pasca r c)
  (if (or (= c 1) (= r c))
      1
      (+ (pasca (- r 1) c)
         (pasca (- r 1) (- c 1)))))

(pasca 1 1)
(pasca 2 1)
(pasca 2 2)
(pasca 3 2)
