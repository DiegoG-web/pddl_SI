(define (domain travelDomain)
    (:requirements :typing :negative-preconditions) ;necessary to remove warnings

(:predicates
    (visited ?x)
    (current ?x)
    (connected ?x ?y)
)

(:action moveTo
        :parameters (?x ?y)
        :precondition (and (current ?x) (connected ?x ?y))
        :effect (and (visited ?y)  (not (current ?x)) (current ?y))
)


)
s