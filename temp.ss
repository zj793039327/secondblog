
(define (cube x)
  (define (cube-iter guess)
    (if (goods-enouth? guess)
	guess
	(cube-iter (improve guess))))
  
  (define (goods-enouth? guess)
   (< (abs (- (* guess guess guess) x)) 0.001)
   )

  
  (define (improve guess)
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
 (cube-iter 1.0)
 )

(cube 9)
(cube 8)
(cube 10)
(cube 27)
(cube 81)
(cube 1000)
(cube 0.001)


(define (inc x)
  (+ x 1))
(define (dec x)
  (- x 1))

(define (++ a b)
   (if ( = a 0)
       b
       (inc (++ (dec a) b)))
   )

;; (++ 4 5)
;; (inc (++ 3 5)))
;; (inc (inc (++ 2 5)))
;; (inc (inc (inc (++ 1 5))))
;; (inc (inc (inc (inc (++ 0 5)))))
;; (inc (inc (inc (inc (5)))))
;; (inc (inc (inc (6))))
;; (inc (inc 7))
;; (inc 8)
;; 9
(define (++ a b)
   (if ( = a 0)
   b
   (++ (dec a) (inc b))))
;;(++ 4 5)
;;(++ 3 6)
;;(++ 2 7)
;;(++ 1 8)
;;(++ 0 9)
;;9


(++ 4 5)

(define (A x y)
   (cond ((= y 0) 0)
         ((= x 0) (* 2 y))
         ((= y 1) 2)
         (else (A (- x 1) (A x (- y 1))))))
;;(A 0 10)
;;(

;;(A 1 2)
;;((A 0 (A 1 1))
;;((A 0 2))
;;(* 2 2)
;;4
;;(A 1 4）
;;(A 0 (A 1 3))
;;(A 0 (A 0 (A 1 2)))
;;(A 0 (A 0 (A 0 (A 1 1)))
;;(A 0 (A 0 (A 0 2))
;;(A 0 (A 0 4))
;;(A 0 8)
;;16

;;(A 2 3)
;;(A 1 (A 2 2))
;;(A 1 (A 1 (A 2 1)))
;;(A 1 (A 1 2))
;;(A 1 (A 0 (A 1 1)))
;;(A 1 (A 0 (A 1 1)))
;;(A 1 (A 0 2))
;;(A 1 4)

(define (run-show-costs t)
  (define start (current-inexact-milliseconds))
  (define ans (eval t))
  (format "ans is ~s, costs ~s s" ans (round (- (current-inexact-milliseconds) start)))
  )

(define (count-change amount) (cc amount 3))

(define (cc amount kinds-of-coins)
     (cond ((= amount 0) 1)
           ((or (< amount 0) (= kinds-of-coins 0)) 0)
           (else (+
	         (cc amount (- kinds-of-coins 1))
	         (cc (- amount
		   (first-denomination kinds-of-coins)) kinds-of-coins)))))


(define (first-denomination kinds-of-coins)
   (cond ((= kinds-of-coins 1) 1)
         ((= kinds-of-coins 2) 2)
         ((= kinds-of-coins 3) 5)
         ;; ((= kinds-of-coins 3) 10)
         ;; ((= kinds-of-coins 4) 20)
         ;; ((= kinds-of-coins 5) 50)
	 ;; ((= kinds-of-coins 6) 2)
	 ))

(count-change 20)

(cc 3 5)
(+ (cc 3 4) (cc -47 5))
(+ (cc 3 4) 0)
..
(cc 3 2)
(+ (cc 3 1) (cc -2 2))
(cc 3 1)
(+ (cc 3 0) (cc 1 1))
(+ 0 (+ (cc 1 0) (cc -1 0)) )


#lang racket
(define (change amount coins)
  (-> exact-integer? (listof exact-integer?) exact-integer?)
  (define tb (make-hash))
  (define (del1 x) (- x 1))
  (define (cc amount kind-of-coins)
    (cond [(= amount 0) 1]
          [(or (< amount 0) (= kind-of-coins 0)) 0]
          [else
           (define k1 (format "~s-~s" amount (del1 kind-of-coins)))
           (define k2 (format "~s-~s" (- amount (list-ref coins (del1 kind-of-coins))) kind-of-coins))
           (+
            (cond [(hash-has-key? tb k1)
                   (hash-ref tb k1)]
                  [else
                   (hash-set! tb k1  (cc amount (del1 kind-of-coins)))
                   (hash-ref tb k1)
                   ]
                  )
            (cond [(hash-has-key? tb k2)
                   (hash-ref tb k2)]
                  [else 
                   (hash-set! tb k2 (cc (- amount (list-ref coins (del1 kind-of-coins))) kind-of-coins))
                   (hash-ref tb k2)
                   ]
                  )
            )
           ]
          ))
  (cc amount (length coins))
  )


(change 100 (list 1 2 5 10 20 50))
(change 10 (list 1 2 5))
(change 5 (list 1 2 5))
(change 500 (list 3 5 7 8 9 10 11))

;;;;;;;;; exercise 1.11 的代码
(define (f n)
  (cond [(< n 3) n]
	(else (+ (f (- n 1))
		 (* 2 (f (- n 2)))
		 (* 3 (f (- n 3)))))))

(define (f2 n)
  (define (f-iter a b c count)
    (cond [(< n 3) n]
	  [(<= count 0) a]
	  [else (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))]))
  (f-iter 2 1 0 (- n 2)))

 (define (f n) 
   (define (f-i a b c count) 
     (cond ((< n 3) n) 
           ((<= count 0) a) 
           (else (f-i (+ a (* 2 b) (* 3 c)) a b (- count 1))))) 
   (f-i 2 1 0 (- n 2))) 

;; exercise 1.12 帕斯卡三角形

(define (pascal-tri n)
  (cond [(= n 1) '(1)]
	[(= n 2) '(1 1)]
	[]
	)
  )

 (define (pascal r c) 
   (if (or (= c 1) (= c r)) 
       1 
       (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c))))
  
 ;; Testing 
 (pascal 1 1)
 (pascal 2 2) 
 (pascal 3 2) 
 (pascal 4 2) 
 (pascal 5 2) 
(pascal 5 3)

 (define (pascal col depth) 
   (cond  
     ((= col 0) 1) 
     ((= col depth) 1) 
     (else (+ (pascal (- col 1) (- depth 1))  
              (pascal col ( - depth 1))))))


(define (pascals-triangle number row) 
   (define (factorial n) 
     (define (iter n acc) 
       (if (< n 2) acc 
                   (iter (- n 1) (* n acc)))) 
     (iter n 1)) 
   (/ (factorial (- row 1)) (* (factorial (- number 1)) (factorial (- (- row 1) (- number 1)))))) 
  
(pascals-triangle 1000 2000)


(define (pascal x y)
  (define current null)
  (define previous null)
  (define table (make-vector (add1 x) 1))
  (for ([i (in-range 1 (add1 x))])
    (set! previous 1)
    (for ([j (in-range 1 i)])
      (set! current (vector-ref table j))
      (vector-set! table j (+ (vector-ref table j) previous))
      (set! previous current)))
  (vector-ref table y))
