;Write recursive Lisp functions for the following problems (optionally, you may use MAP functions):
;A binary tree is memorised in the following two ways:
;(node no-subtrees list-subtree-1 list-subtree-2 ...) (1)
;(node (list-subtree-1) (list-subtree-2) ...) (2)
;As an example, the tree
; A
;/ \
;B C
; / \
; D  E
;is represented as follows:
;(A 2 B 0 C 2 D 0 E 0) (1)
;(A (B) (C (D) (E))) (2)

;1. Return the number of levels of a tree of type (1)

;right(L-list k-number)
(defun right(L k)
    (cond
        ((equal k 1) L)
        (T (right (cddr L) (- (+ k (cadr L)) 1)))
    )
)

;levels(L -list)
(defun levels(L)
    (cond
        ((null L) 0)
        ((equal (Car (Cdr L)) 0) 1)
        ((equal (Car (Cdr L)) 1) (+ 1 (levels (cdr (cdr l)))) )
        ((equal (Car (Cdr L)) 2) (+ 1 (max (levels (cdr (cdr l))) (levels (right (cdr (cdr l)) 2) )   ) ))
        (T NIL)
    )
)
(print (levels '() ))
(print (levels '(D 0) ))
;(print (right '(B 0 C 2 D 0 E 0) 2))
(print (levels '(A 2 B 0 C 2 D 0 E 0) ))
(print (levels '(A 2 B 2 C 2 D 0 E 2 E1 0 E2 0 F 0 G 0) ))
