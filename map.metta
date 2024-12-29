(: map (-> (-> $t $t) Expression Expression))
(= (map $func $ex) 
    (if (== $ex ())
        ()
        (let* 
            (
                ($head (car-atom $ex))
                ($tail (cdr-atom $ex))
                ($new-head ($func $head))
                ($new-tail (map $func $tail))
            )
            (if (== (get-metatype $head) Expression)
                    (if (== $tail ())
                        ($head)
                        (cons-atom $head $new-tail)
                    )
                (cons-atom $new-head $new-tail) 
            )
        )
    )
)
(: add2 (-> Number Number))
; add function
(= (add2 $x)
    (+ $x 2)
)

;; Test 06 -- map (recursive)

! (assertEqual (map not (True False True)) (False True False))

! (assertEqual (map add2 (1 2 3)) (3 4 5))

! (assertEqual (map add2 ((1 4) 2 3)) ((1 4) 4 5))