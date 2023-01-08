;1. Write a function to check if an atom is member of a list (the list is non-liniar)
(defun member1(a l)
    (cond
        ((and (atom l) (not (equal a l))) 0)
        ((and (atom l) (equal a l)) 1)
        (T (apply '+ (mapcar (lambda (x) (member1 a x)) l)))
    )
)
(defun member2(a l)
    (cond
        ((equal (member1 a l) 0) nil)
        (T T)
    )
)


;(print (member2 2 '(3 3 4 ((((2)))))))

;2. Write a function that returns the sum of numeric atoms in a list, at any level.
(defun sum(x)
    (cond
        ((numberp x) x)
        ((atom x) 0)
        (t (apply '+ (mapcar 'sum x)))
    )

)
;(print (sum '(1 2 3 4 (a) b c)))
;(print (sum '(1 (2) 3 4)))

;3. Define a function to tests the membership of a node in a n-tree represented as (root list_of_nodes_subtree1 ... list_of_nodes_subtreen)
;Eg. tree is (a (b (c)) (d) (E (f))) and the node is "b" => true

(defun member3(l el)
    (cond
        ((and (atom l) (equal l el)) 1)
        ((and (atom l) (not (equal l el))) 0)
        ((and (listp l) (equal (length l) 1)) (member3 (car l) el))
        (T (apply '+ (mapcar (lambda (x) (member3 x el)) l)))
    )
)

;(print (member3 '(a (b (c)) (b) (E (f))) 'b))

;4. Write a function that returns the product of numeric atoms in a list, at any level.

;product(x-List or atom)
(DEFUN product(x)
(COND
 ((numberp x) x)
 ((atom x) 1)
 (t (apply '* (mapcar 'product x)))
)
)

;5. Write a function that computes the sum of even numbers and the decrease the sum of odd numbers, at any level of a list.
(defun superSum(l)
    (cond
        ((and (numberp l) (equal (mod l 2) 0)) l)
        ((and (numberp l) (equal (mod l 2) 1)) (- 0 l))
        ((atom l) 0)
        (T (apply '+ (mapcar 'superSum l)))
    )
)

;(print (superSum '(1 2 3 4 5 6 (7 8 9 (10)) a)))

;7. Write a function that substitutes an element E with all elements of a list L1 at all levels of a given list L.
(defun substitue2(l li e)
    (cond
        ((and (atom l) (equal l e)) li)
        ((atom l) l)
        (T (mapcar (lambda (x) (substitue2 x li e)) l))
    )
)
;(print (substitue2 '(5 324 423 s 3 32 (32 5 ( 5)))  '(6531231) '5))

;8. Write a function to determine the number of nodes on the level k from a n-tree represented as follows: (root list_nodes_subtree1 ... list_nodes_subtreen)
;Eg: tree is (a (b (c)) (d) (e (f))) and k=1 => 3 nodes
(defun numberNodes(tree k)
    (cond
        ((and (equal k 0) (listp tree)) 1)
        ((not (listp tree)) 0)
        ((< k 0) 0)
        (T (apply '+ (mapcar (lambda (x) (numberNodes x (- k 1))) tree)))
    )
)

;(print (numberNodes '(a (b (c)) (d) (e (f))) 76))