(define (domain travelDomain)
    (:requirements :typing :negative-preconditions :fluents) ;necessary to remove warnings
; :number-fluents
    (:types
        person
    )
    (:predicates
        (greeted ?x - person)
    )
    (:functions
        (greetednumber ?x - person)
    )
    (:action hello
            :parameters (?x - person)
            ; :precondition (and (not (greeted ?x)) (<= (greetednumber ?x) 20))
            ; :precondition (and (<= (greetednumber ?x) 20))
            :precondition ()
            :effect (and (greeted ?x) (increase (greetednumber ?x) 1))
    )

)
;ctrl+k+c
;ctrl+k+u
