(define (problem travelProblemBonus) (:domain travelDomainBonus)
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
    (connected e d)
    (connected b e)

    (connected b a)
    (connected c a)
    (connected e c)
    (connected d c)
    (connected d e)
    (connected e b)

    (current a)
    ;(visited a)

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
