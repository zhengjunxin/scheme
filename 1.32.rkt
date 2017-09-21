#lang scheme

#! 递归的 accumulate
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

#! 迭代的 accumulate
(define (acc-iter combiner null-value term a next b)
  (define (iter combiner null-value term a next b result)
    (if (> a b)
        result
        (iter combiner null-value term (next a) next b (combiner result (term a)))))
  (iter combiner null-value term a next b null-value))

#! 迭代的 accumulate
(define (acc-iter2 combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))


