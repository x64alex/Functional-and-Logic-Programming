;1.a Write a function to return the n-th element of a list, or NIL if such an element does not exist.
;element(L - list)
(defun element(l k)
    (cond
        ((null l) NIL)
        ((equal k 0) NIL)
        ((equal k 1) (CAR l))
        (T(element (CDR l) (- k 1)))
    )
)
(print "Examples for A")
(print (element '(1 2 3 -5) 4))
(print (element '(1 2 3 -5) 0))
(print (element '(1 2 3 -5) 5))

;1.b Write a function to check whether an atom E is amember of a list which is not necessarily linear
;memb(L - list E-atom)
(defun memb(L E)
    (cond
        ((null L) NIL)
        ((equal (CAR L) E) T)
        ((atom (CAR L)) (memb (CDR L) E))
        ((listp (CAR L)) (OR (memb (CAR L) E) (memb (CDR L) E)))      
        (T NIL)
    )

)
(print "Examples for B")
(print (memb '(1 2 3 4) 2))
(print (memb '(1 (2) 3 4) 2))
(print (memb '(1 (((2))) 3 4) 2))
(print (memb '(1 ((2)) 3 4) 5))
(print (memb '(1 ((2 6 7)) 3 4) 5))



;1.c Write a function to determine the number of sublists of a given list, on any level. 
;   A sublist is either the list itself, or any element that is a list, at any level. 
;   Example: (1 2 (3 (4 5)(6 7)) 8 (9 10)) => 5 sublists:
;  (  (1 2 (3 (4 5) (6 7)) 8 (9 10))    (3 (4 5) (6 7))     (4 5)   (6 7)   (9 10) )
;numb(L - list)
(defun numb(L)
    (cond
        ((null L) 1)
        ((atom (CAR L) ) (numb (CDR L)))
        (T (+ (numb (CAR L)) (numb (CDR L)) ))
    )
    
)


(print "Examples for C")
(print (numb '(1 2 3)))
(print (numb '(1 2 (3 (4 5) (6 7)) 8 (9 10)) )) 
(print (numb '() )) 
(print (numb '((((((())))))) )) 

;1.d Write a function to transform a linear list into a set.

;getset(L - list)
(defun getset(L)
    (cond
        ((null L) NIL)
        ((equal (length L) 1) L)
        ((memb (cdr L) (car l)) (getset (cdr L) ))
        (T (cons (car l) (getset (cdr L))))
    )
)
(print "Examples for D")
(print (getset '()))
(print (getset '(1)))
(print (getset '(1 1)))
(print (getset '(1 1 1) ))
(print (getset '(1 2 1)))
(print (getset '(1 2 3) ))
(print (getset '(1 2 3 34 43 4 4 2 24 56 6 4) ))