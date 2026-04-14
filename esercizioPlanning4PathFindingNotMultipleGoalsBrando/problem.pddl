(define (problem PathFindingProblemNoMultipleGoals) (:domain PathFindingDomainNoMultipleGoals)
(:objects 
    c - cellAgent
    w1 - wall
    w2 - wall
    w3 - wall
    w4 - wall
    w5 - wall
)

(:init
    (= (xpos c) 0)
    (= (ypos c) 0)

    (= (wallXpos w1) 0)
    (= (wallYpos w1) 1)

    (= (wallXpos w2) 2)
    (= (wallYpos w2) 0)

    (= (wallXpos w3) 2)
    (= (wallYpos w3) 1)
    
    (= (wallXpos w4) 2)
    (= (wallYpos w4) 2)

    (= (wallXpos w5) 1)
    (= (wallYpos w5) 3)
)

(:goal (and
    (= (xpos c) 9) 
    (= (ypos c) 9)
))

;un-comment if metric is needed
;opt-hrmax bat config
;java -jar "%~dp0..\enhsp25.jar" -o %1 -f %2 -planner opt-hrmax -sjr
(:metric minimize (steps))
)
