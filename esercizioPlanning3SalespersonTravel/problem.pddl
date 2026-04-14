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

    (connected b a)
    (connected c a)
    (connected e c)
    (connected d c)

    (current a)
    (visited a)

)

(:goal (and
    (current a)
    (visited a)
    (visited b)
    (visited c)
    (visited d)
    (visited e)
))

)
