;1.a Write a function to return the n-th element of a list, or NIL if such an element does not exist.

(defun element(l k)
    (cond
        ((null l) NIL)
        ((equal k 0) NIL)
        ((equal k 1) (CAR l))
        (T(element (CDR l) (- k 1)))
    )
)
(print (element '(1 2 3 -5) 4))
(print (element '(1 2 3 -5) 0))
(print (element '(1 2 3 -5) 5))

;1.b Write a function to check whether an atom E is amember of a list which is not necessarily linear
(defun member(L E)
    (cond
        ((equal (CAR L) E) T)
    )

)

(print (member (1 2 3 4) 1))

;1.c Write a function to determine the listof all sublists of a given list, on any level. 
;   A sublist is either the list itself, or any element that is a list, at any level. 
;   Example: (1 2 (3 (4 5)(6 7)) 8 (9 10)) => 5 sublists:
;  (  (1 2 (3 (4 5) (6 7)) 8 (9 10))    (3 (4 5) (6 7))     (4 5)   (6 7)   (9 10) )
