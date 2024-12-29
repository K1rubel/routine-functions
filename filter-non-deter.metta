;(: filter (-> (-> $t Bool) Expression Expression))
(= (filter $func $expr)
    (collapse
        (
        let $non-det (superpose $expr)
            (if (== (get-metatype $non-det) Expression)
                (empty)
                (case 
                    ($func $non-det)
                    (
                        (True $non-det)
                        (False (empty))
                    )
                )
            )
        )
    )
)

(: isEven -> Number Bool)

(=(isEven $x)
    (== (% $x 2) 0)
)

;; Test 03 -- filter (non-determinism)

! (assertEqual (filter isEven (2 3 4 5)) (2 4))

! (assertEqual (filter isEven (2 3 4 5 (8 9) 12 13 16)) (2 4 12 16))

! (assertEqual (filter isEven (3 5)) ())