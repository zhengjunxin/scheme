#lang scheme

(define (f-recur n)
  (if (< n 3)
      n
      (+ (f-recur (- n 1))
         (* 2 (f-recur (- n 2)))
         (* 3 (f-recur (- n 3))))))


(define (f n) (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (= 0 count)
      c
      (f-iter (+ a (* 2 b) (* 3 c))
              a
              b
              (- count 1))))

(define number 5)

(f number)
(f-recur number)