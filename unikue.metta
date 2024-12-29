;; retun only unique elements
;; works as follows
;; takes the head and appends it to the contents of the accumulator $acc
;; removes all occurrences of the $head from $tail using non-determinism and conditionals
;; calls the function again with the new accumulator now ($head) and the new tail with all the head instances removed from it
;; terminates when (cdr-atom $tailWithoutHead) == ()

(: unyque (-> Experession Experession Experession))

(= (unyque $expr $acc)
    (if (== $expr ())
        $acc
        (let* (
            ($head (car-atom $expr))
            ($tail (cdr-atom $expr))
            ($carry (collapse (union (superpose $acc) $head)))
            )
            (if (== $tail ())
                $carry
                (let $tailWithoutHead (collapse 
                        (let $x (superpose $tail)
                                (if (== $head $x)
                                    (empty)
                                    $x
                                )
                        ))
                (unyque $tailWithoutHead $carry )
            )))))

(: unikue (-> Experession Experession))

(= (unikue $expr)
    (unyque $expr ())
)

;; Test 11 -- unikue (non-deterministic)

! (assertEqual (unikue ()) ())

! (assertEqual (unikue (A B)) (A B))

! (assertEqual (unikue (A A A)) (A))

! (assertEqual (unikue (A B A B C A)) (A B C))
