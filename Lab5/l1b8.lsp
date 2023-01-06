;8. Return the list of nodes of a tree of type (2) accessed inorder.
; (A (B) (C (D) (E))) -> (B A D C E)

(defun concat2(a b)
    (cond
        ((null a) b)
        (T (cons (car a) (concat2 (cdr a) b)    ) )
    )
)

(defun inorder(L)
    (Cond
        ((null L) null)
        ((= (length L) 1) L)
        (T (concat2 (inorder (cadr L)) (cons (car L) (inorder (caddr L)))) )
    )
)

(print (inorder '(A (B) (C (D) (E)))))
