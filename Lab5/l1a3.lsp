;(print (Cons 1 (COns '(2 3) nil)))
;(print (mod 5 3))

;a) Write a function that inserts in a linear list a given atom A after the 2nd, 4th, 6th, ... element.

(defun insert(l a)
    (insertel l a 1)
)

(defun insertel(l a k)
    (cond
        ((null l) nil)
        ((= (mod k 2) 1) (cons (car l) (insertel (cdr l) a (+ k 1))))
        (T (cons (car l) (cons a (insertel (cdr l) a (+ k 1)))))
    )
)

;(print (insertel '(1 2 3 4) 327 1))
;(print (insert '(1 2 3 4) 327))

;b) Write a function to get from a given list the list of all atoms, on any
;level, but reverse order.
; Example: (((A B) C) (D E)) ==> (E D C B A)

(defun concat-lists (seq1 seq2)
  (cond
        ((null seq1) seq2)
      (T (cons (car seq1) (concat-lists (cdr seq1) seq2)))
    )
)

(defun getList(L)
    (cond
        ((null L) nil)
        ((atom (car l)) (cons (car l) (getList (cdr l))   ))
        (T (concat-lists (getList (car l)) (getList (cdr l))   ))
    )

)

(defun reverseList(l)
    (reverse (getList l))
)

;(print (reverseList '(1 2 3 4 (1 2 3 ) (1 2 (2 90))) ))

;c) Write a function that returns the greatest common divisor of all numbers in a nonlinear list.

(defun gcd2k(a b k)
    (cond
        ((and (= (mod a k) 0) (= (mod b k) 0)) k)
        (T (gcd2k a b (- k 1)))
    )
)

(defun gcd2(a b)
    (cond
        ((null b) a)
        ((null a) b)
        (T (gcd2k a b a))
    )
    )
    
(defun gcd3k(L)
    (cond 
        ((null l) nil)
        ((and (= (length L) 1) (numberp (car l)))  (car l))
        ((listp (car l)) (gcd2 (gcd3k (Car l)) (gcd3k (cdr l))))
        (T (gcd2 (Car l) (gcd3k (cdr l)))) 
    )
)
;(print (gcd2k 2 3 1))
;(print (gcd2k 2 4 2))
;(print (gcd2 2 4))
(print (gcd3k '(2 4 6 8 ( 8 10)))  )