(= (foldl $func $expr)
    (if (== $expr ())
        $expr
        (let* (
            ($head (car-atom $expr))
            ($tail (cdr-atom $expr))
            )
            (if (== (get-metatype $head) Experession)
                (foldl $func $tail)
                (if (== $tail ())
                    $head
                    (let* (
                        ($h (car-atom $tail))
                        ($t (cdr-atom $tail))
                        )
                        (if (== $t ())
                            ($func $head $h)
                            (let $temp ($func $head $h)
                                ($func $temp (foldl $func $t))
                            )
                        )))))))

(= (max $x $y)
    (if (> $x $y)
        $x
        $y
    ))

(= (add $x $y)
    (+ $x $y)
)
;; Test

! (assertEqual 
    (foldl add (2)) 
        2)

! (assertEqual 
    (foldl add (2 3 4)) 
       9)

! (assertEqual 
    (foldl max (1 4 3)) 
        4)

! (assertEqual 
    (foldl or (True False False True))
        True)

! (assertEqual 
    (foldl and (True False False True))
        False)