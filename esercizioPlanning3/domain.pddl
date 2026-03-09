;Header and description
;Header and description

(define (domain travelDomain)
    (:requirements :typing :negative-preconditions) ;necessary to remove warnings

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (visited ?x)
    (lastVisited ?x)
    (connected ?x ?y)
)
(:action moveTo
        :parameters (?x ?y)
        :precondition (and (not (visited ?y)) (lastVisited ?x) (connected ?x ?y))
        :effect (and (visited ?y) (not (lastVisited ?x)) (lastVisited ?y))
    )



;define actions here

)
