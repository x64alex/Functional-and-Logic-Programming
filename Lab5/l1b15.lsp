;15. Determine the list of nodes accesed in postorder in a tree of type (2).
;(A (B) (C (D) (E)))

(defun postorder1(tree)
    (cond
        ((null tree) null)
        ((or (atom tree) (and (listp tree) (equal (length tree) 1))) tree)
        (T (list (postorder1 (cadr tree)) (postorder1 (caddr tree)) (postorder1 (car tree))))
    )
)

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

(defun postorder(tree)
    (getList (postorder1 tree))
)

(print (postorder1 '(A (B) (C (D) (E))  )))
