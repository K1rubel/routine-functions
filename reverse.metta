(: rev (-> Experession Experession Experession))

(= (rev  $expr $acc)
    (if (== $expr ())
        $acc
        (let*(
            ($head (car-atom $expr))
            ($carry (cons-atom $head $acc))
            ($tail (cdr-atom $expr))
            )
            (rev $tail $carry)
        )
    )
)

(: reverse (-> Experession Experession))

(= (reverse $expr)
	(rev $expr ())
)
;; Test

! (assertEqual 
    (reverse (A B C 1 2))
        (2 1 C B A))