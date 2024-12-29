;; (= ($func $x $expr)
;;     (if (== $expr ())
;;         $x
;;         ($func $x $expr)
;;     )
;; )

(= (foldl $func $expr)
    (if (== $expr ())
        ()
        (let* (
            ($head (car-atom $expr))
            ($tail (cdr-atom $expr))
            ($newHead (car-atom $tail))
            ($newTail (cdr-atom $tail))
            )
            (if (== (get-metatype $head) Expression)
                (foldl $func $tail)
                (if (== $tail ())
                    $head
                    (if (== (get-metatype $newHead) Expression)
                            (if (== $newTail ())
                                $head
                                ($func $head (foldl $func $newTail))
                            )
                            (let $carry ($func $head $newHead)
                                (if (or (== $newTail ()) (== (cdr-atom $newTail) ()))
                                    $carry
                                    ($func $carry (foldl $func $newTail))
                                ))))))))


(= (add $x $y)
    (+ $x $y)
)

(= (max $x $y)
    (if (> $x $y)
        $x
        $y
    )
)

! (foldl add ())
! (foldl add (3))
! (foldl add (3 4))
! (foldl add (1 2 3))
! (foldl add (1 2 4 (2 3)))
! (foldl add (1 2 (2 3) 1))
! (foldl and (True True False))
! (foldl or (True True False))