(define (domain PathFindingDomainNoMultipleGoals)

    ; We need :typing for objects and :fluents for numeric math 
    (:requirements :typing :fluents :negative-preconditions :universal-preconditions)
    
    ; Step 1: Define the Entities
    (:types 
        cellAgent wall - object
    )

    (:functions
        (xpos ?c - cellAgent)
        (ypos ?c - cellAgent)
        (steps ?c - cellAgent)
        (wallXpos ?w - wall)
        (wallYpos ?w - wall)
    )

    (:action moveNorth
        :parameters (?c - cellAgent) 
        :precondition (and (<= (ypos ?c) 8)
            ;check for walls in the direction of travel
            (forall (?w - wall)
                (not (and 
                    (= (wallXpos ?w) (xpos ?c))
                    (= (wallYpos ?w) (+ (ypos ?c) 1)); + for temporary math
                ))
            )
        )
        :effect (and (increase (ypos ?c) 1)(increase (steps ?c) 1))
    )
    (:action moveSouth
        :parameters (?c - cellAgent) 
        :precondition (and (>= (ypos ?c) 1)
            ;check for walls in the direction of travel
            (forall (?w - wall)
                (not (and 
                    (= (wallXpos ?w) (xpos ?c))
                    (= (wallYpos ?w) (- (ypos ?c) 1)); + for temporary math
                ))
            )
        )
        :effect (and (decrease (ypos ?c) 1)(increase (steps ?c) 1))
    )
    (:action moveEast
        :parameters (?c - cellAgent) 
        :precondition (and (<= (xpos ?c) 8)
            ;check for walls in the direction of travel
            (forall (?w - wall)
                (not (and 
                    (= (wallYpos ?w) (ypos ?c))
                    (= (wallXpos ?w) (+ (xpos ?c) 1)); + for temporary math
                ))
            )
        )
        :effect (and (increase (xpos ?c) 1)(increase (steps ?c) 1))
    )
    (:action moveWest
        :parameters (?c - cellAgent) 
        :precondition (and (>= (xpos ?c) 1)
            ;check for walls in the direction of travel
            (forall (?w - wall)
                (not (and 
                    (= (wallYpos ?w) (ypos ?c))
                    (= (wallXpos ?w) (- (xpos ?c) 1)); + for temporary math
                ))
            )
        )
        :effect (and (decrease (xpos ?c) 1)(increase (steps ?c) 1))
    )

)