;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Question 2
;interval-proper-subset?: -> 2 intervals lile [x y] and [z t]
;Numbers:
(check-expect (interval-proper-subset? 1 2 1 3) true)
(check-expect (interval-proper-subset? 2 5 1 5) true)
(check-expect (interval-proper-subset? 2 4 5 6) false)
(check-expect (interval-proper-subset? 2 3 2 3) false)
(check-expect (interval-proper-subset? 1 3 2 5) false)
(check-expect (interval-proper-subset? 1 3 2 7) false)
(check-expect (interval-proper-subset? 2 4 1 3) false)
(check-expect (interval-proper-subset? 4 5 1 2) false)
(check-expect (interval-proper-subset? 2 4 1 5) true)

(define (interval-proper-subset? x y z t)
  (cond
    [(or (and (<= z x) (<= x y) (< y t) (not (= z t))) (and (< z x) (<= x y) (<= y t) (not (= z t))))  #true]
    [else #false]))
; Test of my program:
(check-expect (interval-proper-subset? 2 4 2 1) false)
(check-expect (interval-proper-subset? 4.5 5.5 2 6) true)
; Example:
(interval-proper-subset? 0.5 3 0 5)
(interval-proper-subset? 0.5 5 1 2)





