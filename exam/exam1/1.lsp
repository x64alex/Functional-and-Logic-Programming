(defun removep(L)
    (cond
        ((and (numberp L) (= 0 (mod L 3))) nil)
        ((atom L) (List L))
        (T (List (mapcan #'removep L)))
    )
)

(print (removep '(1 2 3 (a (3 b) (3) 5 6))))

(defun G(L) (mapcon #'list L))
(print (apply #'append (mapcon #'G '(1 2))))
(print (list '((1 2))))
(print (mapcan #'list '(1 2 3)))
(print (mapcon #'list '(2 3 4 5 5)))
(print (nconc '(1 2 3) '(4 5 6)))

(setq x '(A B))
(setf (Car x) '(B C))
(set 'z '(C D))

(print x )
(print y )
(print z )

