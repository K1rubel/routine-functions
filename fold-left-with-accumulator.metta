(:foldleft (-> (->$t $t) Grounded Expression Expression))
(= (foldleft $func $acc $expr)
    (if (== $expr ())
        $acc
        (let*(
                ($head (car-atom $expr))
                ($tail (cdr-atom $expr))
                ($carry ($func ($acc $head)))
            )
            (if (== (get-metatype $head) Expression)
                (if (== $tail ())
                    $acc
                    (foldleft $func $acc $tail)
                )
                (foldleft $func $carry $tail)
            )
            
        )
    )
)

(= (add ($x $y))
    (+ $x $y)
)

! (assertEqual (foldleft add 0 (1 2)) 3)

! (foldleft add 0 (1 2 3)); 
! (foldleft add 0 ((1 2))) ; 
! (foldleft add 0 ((1 2) 1)) ;

! (foldleft add 0 (1 2 (3 4)));
! (foldleft add 0 (1 2 (3 4) 4));