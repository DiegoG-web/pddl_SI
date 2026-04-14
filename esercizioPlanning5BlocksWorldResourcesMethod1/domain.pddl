;Header and description

(define (domain blockDomainResources)
    (:requirements :typing :negative-preconditions :fluents) ;necessary to remove warnings

    (:types
    block
    claw
    )

    (:predicates ;todo: define predicates here
        (grasping)
        (onTop ?x - block ?y - block)
        (onTable ?x - block)
        (clear ?x - block) ;oggetto libero al di sopra
        (flying ?x - block) ; oggetto in aria, non appoggiato, sulla pinza, potrebbe provocare righe onTop superflue
    )

    (:functions
    (batteryLevel)
    )
    ;flying e grasping potrebbero essere ridondanti. RIVEDI
    ;se è flying non è onTable, si può SNELLIRE

    (:action stack
        :parameters (?x - block ?y - block)
        :precondition (and (grasping) (not (onTable ?x)) (clear ?x) (clear ?y) (flying ?x) (> (batteryLevel) 0.5))
        :effect (and (not (grasping)) (onTop ?x ?y) (not (clear ?y)) (not (flying ?x)) (decrease (batteryLevel) 0.5))
    )
    (:action unstack
        :parameters (?x - block ?y - block)
        :precondition (and (not (grasping)) (onTop ?x ?y) (clear ?x) (not (clear ?y)) (not (onTable ?x)) (not (flying ?x)) (> (batteryLevel) 1))
        :effect (and (grasping) (not (onTop ?x ?y)) (clear ?y) (flying ?x) (decrease (batteryLevel) 1))
    )
    (:action putdown
        :parameters (?x - block)
        :precondition (and (grasping) (not (onTable ?x)) (clear ?x) (flying ?x) (> (batteryLevel) 0.5))
        :effect (and (not (grasping)) (onTable ?x) (not (flying ?x)) (decrease (batteryLevel) 0.5))
    )
    (:action pickup
        :parameters (?x - block)
        :precondition (and (not (grasping)) (onTable ?x) (clear ?x) (not (flying ?x)) (> (batteryLevel) 1))
        :effect (and (grasping) (not (onTable ?x)) (flying ?x) (decrease (batteryLevel) 1))
    )
    (:action recharge
        :parameters ()
        :precondition (and (not (grasping)))
        :effect (and (assign (batteryLevel) 3)) 
    )
)