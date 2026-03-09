(define (problem travelProblem) (:domain travelDomain)
(:objects 
a
b
c
d
e
)

(:init
    (connected a b)
    (connected a c)
    (connected c e)
    (connected c d)
    
)

(:goal (and
    ;todo: put the goal condition here
    (lastVisited a)
    (visited a)
    (visited b)
    (visited c)
    (visited d)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
