(: () tree)
(: node (-> Number tree tree tree))
(: depth (-> tree Number))

(= (depth ()) 0) 
                
(= (depth (node $n $left $right))
        (let* 
            (
                ($l (depth $left))
                ($r (depth $right))
            )
            (+ 1 (if (> $l $r)
                $l
                $r
            ))))

;; Test Cases

! (assertEqual 
    (depth ()) 
        0)

! (assertEqual 
    (depth (node 1 (node 2 (node 4 (node 5 () ()) ()) ()) (node 6 (node 7 () ()) (node 8 () ())))) 
        4)

! (assertEqual 
    (depth (node 1 (node 2 (node 4 () ()) ()) (node 1 (node 2 (node 2 () ()) (node 3 () (node 5 () ()))) ()))) 
        5)
 