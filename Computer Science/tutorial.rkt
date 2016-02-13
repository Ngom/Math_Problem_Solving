;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname tutorial) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Structural recursion on lists
;;
;; (define (my-list-fn lst)
;;  (cond
;;    [(empty? lst) ...]
;;    [(cons? lst) ... (first lst) ...
;;                 ... (my-list-fn (rest lst)) ...]))
;;
;; Exercise:
;; and-list: (Listof Boolean) -> Boolean
;; Purpose: produces true iff all elements of lst are true
;; Examples:
   (check-expect (and-list '(#false #true)) #false)
   (check-expect (and-list (list (< 4 5) (= 3 (+ 1 2)))) #true)

;; Copy template, develop the function
;; Pay special attention to the empty? case, it is not obvious

(define (and-list lst)
  (cond
    [(empty? lst) #true]
    [else (and (first lst) (and-list (rest lst)))]))

;; Can you do it without using the predefined 'and'?

(define (and-list2 lst)
  (cond
    [(empty? lst) #true]
    [(first lst) (and-list2 (rest lst))]
    [else #false]))

(check-expect (and-list2 '(#false #true)) #false)
(check-expect (and-list2 (list (< 4 5) (= 3 (+ 1 2)))) #true)

;; The predefined function 'andmap' does the same thing as and-list.
;; Why can't we just write (map and lst)?
;; Answer: 'and' is a form, not a function!

;; Exercise:
;; multiply-numbers-on-list: (Listof Any) -> Number
;; multiplies numbers in lst (which can contain other types of values)
;; Examples:

   (check-expect (multiply-numbers-on-list '(1 2 3 4)) 24)
   (check-expect (multiply-numbers-on-list '(3 #false blue 4 "AIMS")) 12)

;; Copy template and develop function
;; Again, the empty? case requires some thought

(define (multiply-numbers-on-list lst)
  (cond
    [(empty? lst) 1]
    [else
       (cond
         [(number? (first lst)) (* (first lst)
                                   (multiply-numbers-on-list (rest lst)))]
         [else (multiply-numbers-on-list (rest lst))])]))

;; Exercise: simplify this so there is only one cond


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Structural recursion on one list parameter
;;   and one number parameter
;;
;; We adapt the template for structural recursion on two lists
;;
;; (define (my-list-fn lst1 lst2)
;;   (cond
;;     [(empty? lst1) ... lst2 ...]
;;     [(empty? lst2) ... lst1 ...]
;;     [(cons? lst1) 
;;         ... (first lst1) ... (first lst2) ...
;;         ... (my-list-fn (rest lst1) lst2) ...
;;         ... (my-list-fn lst1 (rest lst2)) ...
;;         ... (my-list-fn (rest lst1) (rest lst2)) ...])
;;
;; We have to change the parameter lst2 to n and
;; make the appropriate changes in the recursive applications
;;
;; (define (my-listn-fn lst n)
;;   (cond
;;     [(empty? lst) ... n ...]
;;     [(zero? n)  ... lst ...]
;;     [else
;;         ... (first lst) ...
;;         ... (my-list-fn (rest lst) n) ...
;;         ... (my-list-fn lst (sub1 n)) ...
;;         ... (my-list-fn (rest lst) (sub1 n)) ...])
;;
;; Exercise:
;; my-list-ref: (Listof Any) Natural -> Any
;; Purpose: Produces the nth element of lst (counting from zero)
;; Examples:
   (check-expect (my-list-ref '(1 4 9 16) 2) 9)
   (check-expect (my-list-ref '(#true blue "shoe") 0) #true)
   (check-error (my-list-ref '(1 2 3) 3) "index out of range")

;; Copy the template and develop the function

(define (my-list-ref lst n)
  (cond
    [(empty? lst) (error "index out of range")]
    [(zero? n) (first lst)]
    [else (my-list-ref (rest lst) (sub1 n))]))

;; This function is predefined as 'list-ref'.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Set operations
;;
;; A Set is an ordered list of elements.
;;
;; set-minus: Set Set -> Set
;; Purpose: produces set of all elements in lst1 that are not in lst2
;; Examples:

   (check-expect (set-minus '(1 4 5 7) '(2 3 4 5)) '(1 7))
   (check-expect (set-minus '(1 4 5 7) '(0 2 4 6)) '(1 5 7))
;;
;; (define (my-list-fn lst1 lst2)
;;   (cond
;;     [(empty? lst1) ... lst2 ...]
;;     [(empty? lst2) ... lst1 ...]
;;     [(cons? lst1) 
;;         ... (first lst1) ... (first lst2) ...
;;         ... (my-list-fn (rest lst1) lst2) ...
;;         ... (my-list-fn lst1 (rest lst2)) ...
;;         ... (my-list-fn (rest lst1) (rest lst2)) ...])

;;(define (set-minus lst1 lst2)
;;  (cond
;;    [(empty? lst1) empty]
;;    [(empty? lst2) lst1]
;;    [else
;;      (cond
;;        [(< (first lst1) (first lst2)) ...]
;;        [(= (first lst1) (first lst2)) ...]
;;        [(> (first lst1) (first lst2)) ...])]))

(define (set-minus lst1 lst2)
  (cond
    [(empty? lst1) empty]
    [(empty? lst2) lst1]
    [else
      (cond
        [(< (first lst1) (first lst2)) (cons (first lst1) (set-minus (rest lst1) lst2))]
        [(= (first lst1) (first lst2)) (set-minus (rest lst1) (rest lst2))]
        [(> (first lst1) (first lst2)) (set-minus lst1 (rest lst2))])]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Abstract list functions
;;

;; Exercise: redefine the functions in the translation example
;;  using abstract list functions
;;
;;(define (translate lot str) 
;;  (list->string (trans-loc lot (string->list str))))
;;
;;(define (trans-loc lot loc)
;;  (cond
;;    [(empty? loc) empty]
;;    [else (cons (trans-char lot (first loc)) 
;;                (trans-loc lot (rest loc)))]))
;;
;;(define (trans-char lot c)
;;  (cond
;;    [(empty? lot) c]
;;    [((first (first lot)) c) ((second (first lot)) c)]
;;    [else (trans-char (rest lot) c)]))

;; Answer:
;; No recursion in 'translate', that does not change
;; 'trans-char' may stop early, so doesn't quite fit with map and filter

(define (trans-loc lot loc)
  (cond
    [(empty? loc) empty]
    [else (cons (trans-char lot (first loc)) 
                (trans-loc lot (rest loc)))]))

(define (trans-loc2 lot loc)
  (map (lambda (x) (trans-char lot x)) loc))

;; Exercise: Can we develop an abstract list function
;; that generalizes trans-char?

;; first-true: (X -> Boolean) (Listof X) -> (Listof X)
;; Purpose: Produces the list of the first element x of lst such that (p x) is #true
;;             and all other elements after x

(define (first-true p lst)
  (cond
    [(empty? lst) empty]
    [(p (first lst)) lst]
    [else (first-true p (rest lst))]))

;; There is a function very similar to first-true
;;  predefined in ISL; it is called 'memf'.

;;(define (trans-char lot c)
;;  (cond
;;    [(empty? lot) c]
;;    [((first (first lot)) c) ((second (first lot)) c)]
;;    [else (trans-char (rest lot) c)]))

(define (trans-char2 lot c)
  (local
    [(define lst (first-true lot (lambda (pair) ((first pair) c))))]
    (cond
      [(empty? lst) c]
      [else ((second (first lst)) c)])))

;; This is probably harder to read than the original trans-char.



