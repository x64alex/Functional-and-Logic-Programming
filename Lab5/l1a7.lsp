;7.
;a) Write a function to eliminate the n-th element of a linear list.
(defun eliminate(l n)
    (cond
        ((null l) nil)
        ((equal n 1) (cdr l))
        (T (cons (car l) (eliminate (cdr l) (- n 1))))
    )    
)
;(print (eliminate '(1 2) 546))

;b) Write a function to determine the successor of a number represented digit by digit as a list, without transforming the representation of the number from list to number. Example: (1 9 3 5 9 9) --> (1 9 3 6 0 0)

(defun succesor(l)
    (reverse (add (reverse l)))
)

(defun add(l)
    (cond
        ((and (equal (car l) 9) (equal (length l) 1)) (cons 0 '(1)))
        ((equal (car l) 9) (cons 0 (add (cdr l))))
        (T (cons (+ (car l) 1) (cdr l)))
    )
)

;(print (succesor '(1 9 3 5 9 9)))
;(print (succesor '(1 2 3 5 9 9)))
;(print (succesor '(9 9 9 9 9 9)))


;c) Write a function to return the set of all the atoms of a list.

;V1 without mapcar
(defun member2(e l)
    (cond
        ((null l) nil)
        ((atom l) (equalp e l))
        (T (Or (member2 e (car l)) (member2 e (cdr l))))
    )

)

;V2 with mapcar
(defun boolToInt(e)
    (Cond
        ((null e) 0)
        (T 1)
    )
)

(defun member3(e l)
    (cond
        ((atom l) (boolToInt (equalp e l)))
        (T (apply '+ (mapcar (lambda (x) (member3 e x)) l)))
    )

)


(defun getSet(l)
    (cond
        ((null l) nil)
        ((member (car l) (cdr l)) (getSet (cdr l)))
        (T (cons (car l) (getSet (cdr l))))
    )
)


;(print (getSet '(2 2 3 42 4 2 (2 3 (3276)) 42 342)))
(print (member3 5 '(1 (2 (1 3 (2 4) 3) 1) (1 4)) ))
;d) Write a function to test whether a linear list is a set.
(defun set2(l)
    (cond
        ((null l) t)
        ((member (car l) (cdr l)) nil)
        (T (set2 (cdr l)))
    )
)

;(print (set2 '(1 2 3 4 34 42 342)))
