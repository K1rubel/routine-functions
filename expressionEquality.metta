(: === (-> Expression Expression Bool))
(= (=== $a $b)
    (let $diff (collapse (subtraction (superpose $a) (superpose $b)))
        (== $diff ())
        ))

;; Test

! (assertEqual 
    (=== (AND A B) (AND A B))
        True)

;; Order of literals doesn't matter
! (assertEqual 
    (=== (AND A B) (AND B A))
        True)