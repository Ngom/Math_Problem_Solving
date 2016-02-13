;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Question 1
; Middle-of-3 : Number Number Number --> middle-of-3 
; Any Real numbers are wecome.
; Purpose: produces the number which is between x y and z in increasing order.
;Examples:
(check-expect (middle-of-3 5 2 3) 3)
(check-expect (middle-of-3 5 2 2) 2)
(check-expect (middle-of-3 2 2 5) 2)
(check-expect (middle-of-3 2 5 2) 2)
(check-expect (middle-of-3 3 2 5) 3)
(check-expect (middle-of-3 5 3 2) 3)


(define (middle-of-3 x y z) 
  (cond
    [(or (and (< x y) (< y z)) (and (< z y) (< y x))) y]
    [(or (and (< y x) (< x z)) (and (< z x) (< x y))) x]
    [(or (and (< x z) (< z y)) (and (< y z) (< z x))) z]
    [(and (= x y) (not (= x z))) y]
    [(and (= x z) (not (= x y))) x]
    [(and (= y z) (not (= y x))) z]
    [(and (= x y) (= y z)) x]))
; test of my program.
(check-expect (middle-of-3 1 3 2) 2)
(check-expect (middle-of-3 2 2 2) 2)