(: () List)

(: List (-> Number List List))
            
(: list_length (-> List Number))
                
(= (list_length ()) 0)

(= (list_length (List $outer $inner))
        (+ 1 (list_length $inner)) 
    )

;; Test Cases

! (assertEqual 
    (list_length ())
        0)
        
! (assertEqual 
    (list_length (List 3 (List 4 (List 5 (List 0 ())))))
        4)

! (assertEqual 
    (list_length (List 1 (List 2 (List 3 (List 4 (List 5 (List 0 ())))))))
        6)