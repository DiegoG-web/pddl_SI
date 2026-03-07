;Header and description

(define (domain blockDomain)
    (:requirements :typing :negative-preconditions) ;necessary to remove warnings
;remove requirements that are not needed
;(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

;(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle)

; un-comment following line if constants are needed
;(:constants )

    (:predicates ;todo: define predicates here
        (grasping)
        (onTop ?x ?y)
        (onTable ?x)
        (clear ?x) ;oggetto libero al di sotto
        (flying ?x) ; oggetto in aria, non appoggiato, sulla pinza, potrebbe provocare righe onTop superflue
    )

    (:action stack
        :parameters (?x ?y)
        :precondition (and (grasping) (not (onTable ?x)) (clear ?x)(clear ?y) (flying ?x))
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