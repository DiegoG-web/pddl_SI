;Header and description

(define (domain blockDomain)
    (:requirements :typing :negative-preconditions) ;necessary to remove warnings

    (:predicates ;todo: define predicates here
        (grasping)
        (onTop ?x ?y)
        (onTable ?x)
        (clear ?x) ;oggetto libero al di sopra
        (flying ?x) ; oggetto in aria, non appoggiato, sulla pinza, potrebbe provocare righe onTop superflue
    )
    ;flying e grasping potrebbero essere ridondanti. RIVEDI
    ;se è flying non è onTable, si può SNELLIRE

    (:action stack
        :parameters (?x ?y)
        :precondition (and (grasping) (not (onTable ?x)) (clear ?x) (clear ?y) (flying ?x))
        :effect (and (not (grasping)) (onTop ?x ?y) (not (clear ?y)) (not (flying ?x)))
    )
    (:action unstack
        :parameters (?x ?y)
        :precondition (and (not (grasping)) (onTop ?x ?y) (clear ?x) (not (clear ?y)) (not (onTable ?x)) (not (flying ?x)))
        :effect (and (grasping) (not (onTop ?x ?y)) (clear ?y) (flying ?x))
    )
    (:action putdown
        :parameters (?x)
        :precondition (and (grasping) (not (onTable ?x)) (clear ?x) (flying ?x))
        :effect (and (not (grasping)) (onTable ?x) (not (flying ?x)))
    )
    (:action pickup
        :parameters (?x)
        :precondition (and (not (grasping)) (onTable ?x) (clear ?x) (not (flying ?x)))
        :effect (and (grasping) (not (onTable ?x)) (flying ?x))
    )
)