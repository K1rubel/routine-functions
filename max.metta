(: max (-> Experession Grounded))

(= (max $expr)
    (if (== $expr ())
        $expr
        (let* (
            ($head (car-atom $expr))
            ($tail (cdr-atom $expr))
            )
        (if (== $tail ())
            $head
            (let* 
                (
                    ($newHead (car-atom $tail))
                    ($newTail (cdr-atom $tail))
                )
                (if (> $head $newHead)
                    (let $newExpr (cons-atom $head $newTail)
                        (max $newExpr)
                    )
                    (max $tail)
                ))))))

;; Test

! (assertEqual (max (1 2 5 1)) 5)

! (assertEqual (max (2 -5)) 2)