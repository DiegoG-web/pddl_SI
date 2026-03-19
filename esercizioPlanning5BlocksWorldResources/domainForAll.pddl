;Header and description

(define (domain blocksWorldResourcesDomain)

    ;remove requirements that are not needed
    (:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        block
        claw
    )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (grasping ?c - claw ?b - block)
        (clear ?b - block)
        (onTop ?b1 - block ?b2 - block)
        (onTable ?b - block)
        ;(flying ?b - block)
        
    )


    (:functions ;todo: define numeric functions here
        (batteryLevel ?c - claw)
    )

    ;define actions here

    (:action stack
        :parameters (
            ?c - claw 
            ?b1 - block 
            ?b2 - block
        )
        :precondition (and (grasping ?c ?b1) (clear ?b2) (> (batteryLevel ?c) 0.5))
        :effect (and (onTop ?b1 ?b2) (not (grasping ?c ?b1)) (not (clear ?b2)) (decrease (batteryLevel ?c) 0.5))
    )
    (:action unstack
        :parameters (
            ?c - claw 
            ?b1 - block 
            ?b2 - block
        )
        :precondition (and (forall (?b - block) (not (grasping ?c ?b))) (clear ?b1) (onTop ?b1 ?b2) (> (batteryLevel ?c) 1))
        :effect (and (not (onTop ?b1 ?b2))  (grasping ?c ?b1)  (clear ?b2) (decrease (batteryLevel ?c) 1))
    )
    (:action putdown
        :parameters (
            ?c - claw 
            ?b1 - block 
            ;?b2 - block
        )
        :precondition (and (grasping ?c ?b1) (clear ?b1) (> (batteryLevel ?c) 0.5))
        :effect (and (not (grasping ?c ?b1)) (onTable ?b1) (decrease (batteryLevel ?c) 0.5))
    )
    (:action pickup
        :parameters (
            ?c - claw 
            ?b1 - block 
            ;?b2 - block
        )
        :precondition (and (forall (?b - block) (not (grasping ?c ?b))) (onTable ?b1) (clear ?b1) (> (batteryLevel ?c) 1))
        :effect (and (grasping ?c ?b1) (not (onTable ?b1)) (decrease (batteryLevel ?c) 1))
    )
    (:action charge
        :parameters (
            ?c - claw 
            ;?b1 - block 
            ;?b2 - block
        )
        :precondition (and (forall (?b - block) (not (grasping ?c ?b))))
        :effect (and (assign (batteryLevel ?c) 3))
        ;:effect (and (= (batteryLevel ?c) 3))
    )
    

)