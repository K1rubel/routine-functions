
(: Nil tree)
;; Originaly was (: () tree) but it conflicted with another definition (: () List) -- So changed to above
(: N (-> Number tree tree tree))
(: maxDepth (-> tree Number))

(= (maxDepth Nil) 0) 
(= (maxDepth (N $top $left $right))
        (let* (
            ($l (maxDepth $left))
            ($r (maxDepth $right))
        )
        (+ 1 (if (> $l $r)
         $l
         $r
     ))))