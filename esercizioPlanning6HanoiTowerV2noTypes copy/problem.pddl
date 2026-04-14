(define (problem hanoiProblemV2) (:domain hanoiDomainV2)
(:objects 
    d1
    d2
    d3
    d4
    d5
    A
    B
    C
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (= (size d1) 1)
    (= (size d2) 2)
    (= (size d3) 3)
    (= (size d4) 4)
    (= (size d5) 5)
    (= (size A) 10)
    (= (size B) 10)
    (= (size C) 10)
    (onTop d1 d2)
    (onTop d2 d3)
    (onTop d3 d4)
    (onTop d4 d5)
    (onTop d5 A)
    (clear d1)
    (clear B)
    (clear C)
)

(:goal (and
    ;todo: put the goal condition here
    (onTop d1 d2)
    (onTop d2 d3)
    (onTop d3 d4)
    (onTop d4 d5)
    (onTop d5 C)
    (clear d1)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
