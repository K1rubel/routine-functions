
(= (map $f ()) ())
(= (map $f (:: $x $xs))
    (:: ($f $x) (map $f $xs))
)

(: () List)

(: :: (-> Number List List))

(: max_val (-> List Number))

(= (max_val (:: $x $xs)) ; find max values from within list of numbers
    (if (== $xs ())
        $x
        (max ($x (max_val $xs)))
    )
)

(: max (-> (Number Number) Number))

(= (max ($x $y))
    (if (> $x $y)
        $x
        $y
    )
)
(: () tree)

(: tree -> $t tree)

(= (depth (tree $x $xs))

    (if (== $xs ())
        1
        (+ 1 (max_val (map depth $xs)))
    )
)

! (assertEqual 
    (depth (tree A (:: (tree B (:: (tree D ()) (:: (tree E ()) ()))) (:: (tree C ()) (:: (tree F ()) ())))))
        3)

! (assertEqual 
    (depth (tree A (:: (tree B (:: (tree D ()) (:: (tree E (:: (tree F ()) ())) ()))) (:: (tree C ()) ()))))
        4)