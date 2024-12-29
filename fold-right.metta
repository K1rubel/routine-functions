(: foldright (-> (-> Number Number Number) Expression Number))
(= (foldright $func $expr)
    (let* (
        ($head (car-atom $expr))
        ($tail (cdr-atom $expr))
        )
        (if (== (get-metatype $head) Expression)
            (if (== $tail ())
                ()
                (foldright $func $tail)
            )
            (if (== $tail ())
                $head
                ($func $head (foldright $func $tail))
            ))))

(: max (-> Number Number Number))

(= (max $x $y)
    (if (> $x $y)
        $x
        $y
    ))

(: add (-> Number Number Number))

(= (add $x $y)
    (+ $x $y)
)

;; Test 
! (assertEqual (foldright max (3)) 3)

! (assertEqual (foldright  max (3 (2) 4)) 4)

! (assertEqual (foldright add ((3 4) 1 5 2)) 8)

! (assertEqual (foldright add (3 4 1 (3 2) 1)) 9)