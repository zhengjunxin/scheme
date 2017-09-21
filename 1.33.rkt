#lang scheme

#! 有过滤功能的 accumulate
(define (filtered-accumulate combiner null-value term a next b predicate)
  (cond ((> a b) null-value)
        ((predicate a) (combiner (term a)
                                 (filtered-accumulate combiner null-value term (next a) next b predicate)))
        (else (filtered-accumulate combiner null-value term (next a) next b predicate))))

(define (identity n) n)
(define (inc n) (+ n 1))
(define (true n) #t)

(define (sum a b) (filtered-accumulate + 0 identity a inc b even?))

(sum 1 3)