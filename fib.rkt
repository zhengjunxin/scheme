#lang scheme

(define (fib-re n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-re (- n 1))
                 (fib-re (- n 2))))))

(define (fib n) (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= 0 count)
      b
      (fib-iter (+ a b)
                a
                (- count 1))))

(define number 2)

(fib-re number)
(fib number)