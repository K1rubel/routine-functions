(: filter (-> (-> $t Grounded) Expression Expression))
(= (filter $func $expression)
    (if (== $expression ())
        ()
        (let* (
            ($head (car-atom $expression))
            ($tail (cdr-atom $expression))
            ($x (filter $func $tail))
            )
            (if (== (get-metatype $head) Expression)
                (filter $func $tail)
                (if ($func $head)
                    (cons-atom $head $x)
                    (filter $func $tail)
                )
            )
            )))

(: isEven -> Number Bool)

(= (isEven $x)
    (== (% $x 2) 0)
)
;; Test 

! (assertEqual (filter isEven (1 3)) ())

! (assertEqual (filter isEven ((1 2 4) 3)) ())

! (assertEqual (filter isEven (2 3 (4 7) 8 10)) (2 8 10))