(define (domain blocksworld-resources)
    
    ; We need :typing for objects and :fluents for numeric math (battery)
    (:requirements :typing :fluents)
    
    ; Step 1: Define the Entities
    (:types 
        block arm - object
    )
    
    ; Step 2: Define the State of the World
    (:predicates 
        (on ?x - block ?y - block)  ; Block x is sitting directly on Block y
        (ontable ?x - block)        ; Block x is resting on the table
        (clear ?x - block)          ; There is no block sitting on top of Block x
        (handempty ?a - arm)                 ; The robotic arm is not currently holding any block
        (holding ?a - arm ?x - block)        ; The robotic arm is holding Block x
    )
    
    ; Step 3: Define the Resources
    (:functions
        (battery-level ?a - arm)             ; A global numeric tracker for the arm's battery
    )
    
    ; Step 4: Formulate the Physics (Actions)
    
    ; ----------------------------------------------------------------------
    ; RECHARGE: Restores battery to 3, but only if the hand is empty.
    ; ----------------------------------------------------------------------
    (:action recharge
        :parameters (?a - arm) 
        :precondition (and (handempty ?a))
        :effect (and (assign (battery-level ?a) 3.0))
    )

    ; ----------------------------------------------------------------------
    ; PICKUP: Pick a block up from the table. Costs 1 battery.
    ; ----------------------------------------------------------------------
    (:action pickup
        :parameters (?a - arm ?x - block)
        :precondition (and 
            (clear ?x) 
            (ontable ?x) 
            (handempty ?a)
            (>= (battery-level ?a) 1)  ; Must have enough battery before starting
        )
        :effect (and 
            (not (ontable ?x))
            (not (clear ?x))
            (not (handempty ?a))
            (holding ?a ?x)
            (decrease (battery-level ?a) 1) ; Consume resource
        )
    )

    ; ----------------------------------------------------------------------
    ; PUTDOWN: Place a held block onto the table. Costs 0.5 battery.
    ; ----------------------------------------------------------------------
    (:action putdown
        :parameters (?a - arm ?x - block)
        :precondition (and 
            (holding ?a ?x)
            (>= (battery-level ?a) 0.5) ; Must have enough battery to release
        )
        :effect (and 
            (not (holding ?a ?x))
            (clear ?x)
            (ontable ?x)
            (handempty ?a)
            (decrease (battery-level ?a) 0.5) ; Consume resource
        )
    )

    ; ----------------------------------------------------------------------
    ; UNSTACK: Pick a block up from another block. Costs 1 battery.
    ; ----------------------------------------------------------------------
    (:action unstack
        :parameters (?a - arm ?x - block ?y - block)
        :precondition (and 
            (on ?x ?y)          ; x must be on y
            (clear ?x)          ; x must have nothing on it
            (handempty ?a)
            (>= (battery-level ?a) 1) 
        )
        :effect (and 
            (holding ?a ?x)
            (clear ?y)          ; y is now exposed
            (not (clear ?x))
            (not (handempty ?a))
            (not (on ?x ?y))    ; x is no longer on y
            (decrease (battery-level ?a) 1)
        )
    )

    ; ----------------------------------------------------------------------
    ; STACK: Place a held block onto another block. Costs 0.5 battery.
    ; ----------------------------------------------------------------------
    (:action stack
        :parameters (?a - arm ?x - block ?y - block)
        :precondition (and 
            (holding ?a ?x)
            (clear ?y)          ; The target block y must be clear to receive x
            (>= (battery-level ?a) 0.5)
        )
        :effect (and 
            (not (holding ?a ?x))
            (not (clear ?y))    ; y is now covered by x
            (clear ?x)          ; x is now the top of the stack
            (handempty ?a)
            (on ?x ?y)
            (decrease (battery-level ?a) 0.5)
        )
    )
)