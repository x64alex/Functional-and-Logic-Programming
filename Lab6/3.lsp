; 1. Write a function that returns the sum of numeric atoms in a list, at any level.
; Solve the following problems using MAP functions.
;sum(x-List or atom)
(defun sum(x)
    (cond
        ((numberp x) x)
        ((atom x) 0)
        (t (apply '+ (mapcar 'sum x)))
    )

)

;product(x-List or atom)
(DEFUN product(x)
(COND
 ((numberp x) x)
 ((atom x) 1)
 (t (apply '* (mapcar 'product x)))
)
)

(print "Examples")
(print (sum '(1 2 3 4 (a) b c)))
(print (sum '(1 (2) 3 4)))
(print (sum '(1 (((2))) 3 4)))
(print (sum '(1 ((2)) 3 4)))
(print (sum '(1 ((2 6 7)) 3 4)))
(print (sum '(1 ((a v fe)) rw 4)))
