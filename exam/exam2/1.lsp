(defun replaceLevel(L E K)
    (cond
        ((and (atom L) (= k 1) E))
        ((atom L) L)
        (T (mapcar (lambda (x) (replaceLevel x E (mod (+ k 1) 2)))  L))
    )
)

(print (replaceLevel '(1 2 3 (a (3 b) (3) 5 6)) 68747 -1))
