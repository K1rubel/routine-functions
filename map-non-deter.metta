;(: mapn (-> (->$t $t) Expression Expression))

(= (mapn $func $expr)
    (collapse
        (let $result 
                (let $non-det (superpose $expr)
                    (if (== (get-metatype $non-det) Expression)
                        $non-det
                        ($func $non-det)
                    )
                )
        $result
    )))

(= (add2 $x)
    (+ $x 2)
)

;; Test 07 -- map (non-deterministic)

! (assertEqual 
    (mapn not (False True True False))
        (True False False True))

! (assertEqual 
    (mapn add2 (2 3 4)) 
        (4 5 6))

! (assertEqual 
    (mapn add2 (2 3 4 (2 3))) 
        (4 5 6 (2 3)))

! (assertEqual 
    (mapn add2 (2 3 4 (2 3) 12)) 
        (4 5 6 (2 3) 14))
