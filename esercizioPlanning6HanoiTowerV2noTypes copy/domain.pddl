;Header and description

(define (domain hanoiDomainV2)

    (:requirements :typing :negative-preconditions :numeric-fluents)

    (:predicates ;todo: define predicates here
        (onTop ?x ?y)
        (clear ?x)
    )

    (:functions ;todo: define numeric functions here
            (size ?x)
    )

    (:action moveXtoYfromZ
        :parameters (?x ?y ?z)
        :precondition (and 
            (< (size ?x) (size ?y)) 
            (clear ?x) 
            (clear ?y) 
            (onTop ?x ?z))
        :effect (and (onTop ?x ?y) (not (clear ?y)) (not (onTop ?x ?z)) (clear ?z))
    )
)