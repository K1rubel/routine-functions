(: my-unique (-> Expression Expression Expression))
(= (my-unique $acc $expr)
    (if (== $expr ())
        $acc
        (let* (
            ($head (car-atom $expr))
            ($tail (cdr-atom $expr))
            )
            (if (check-atom $head $acc)
                (my-unique $acc $tail)
                (let $unique-expr (cons-atom $head $acc)
                    (my-unique $unique-expr $tail)
                )
            )
        )
    )
)

; helper function to check the presence of an atom in an expression
(: check-atom (-> Grounded Expression Bool))

(= (check-atom $atom $expr)
    (if (== $expr ())
        False
        (let* 
            (
                ($head (car-atom $expr))
                ($tail (cdr-atom $expr))
            )
            (if (== $atom $head)
                True
                (check-atom $atom $tail)
            )
        )
    )
)

;; Test 10 -- unique (recursive)

! (assertEqual (my-unique () ()) ())

! (assertEqual (my-unique () (A B C C)) (C B A))


! (assertEqual (my-unique () (1 2 3 3 5 1)) (5 3 2 1))

! (assertEqual (my-unique () (1 2 3 (3 5) 1)) ((3 5) 3 2 1))
