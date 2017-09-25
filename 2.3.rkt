#lang scheme

(define (make-segment x y) (cons x y))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

(define (make-point x y) (cons x y))
(define (x-point x) (car x))
(define (y-point x) (cdr x))

(define (mid-segment segment)
  (make-point (/ (+ (x-point (start-segment segment))
                    (x-point (end-segment segment)))
                 2)
              (/ (+ (y-point (start-segment segment))
                    (y-point (end-segment segment)))
                 2)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define zero (make-point 0 0))
(define two (make-point 0 3))

(define line (make-segment zero two))

(define (distance x y)
  (let ((v (- (x-point x)
              (x-point y)))
        (h (- (y-point x)
              (y-point y))))
    (if (= v 0)
        (abs h)
        (abs v))))

(define (segment-distance seg)
  (let ((v (- (x-point (start-segment seg))
              (x-point (end-segment seg))))
        (h (- (y-point (start-segment seg))
              (y-point (end-segment seg)))))
    (if (= v 0)
        (abs h)
        (abs v))))

(define (make-rect a b c d)
  (cons (cons a b) (cons c d)))

(define (v-segment rect)
  (make-segment (cdr (car rect))
                (car (cdr rect))))

(define (h-segment rect)
  (make-segment (car (car rect))
                (cdr (car rect))))

(define (perimeter rect)
  (+ (* (segment-distance (v-segment rect)) 2)
     (* (segment-distance (h-segment rect)) 2)))

(define (area rect)
  (* (segment-distance (v-segment rect))
     (segment-distance (h-segment rect))))

(define a (make-point 0 3))
(define b (make-point 3 3))
(define c (make-point 3 0))
(define d (make-point 0 0))

(define rect (make-rect a b c d))
(perimeter rect)
(area rect)
