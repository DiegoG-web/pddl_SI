; ;Header and description

; (define (domain domain_name)

; ;remove requirements that are not needed
; (:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

; (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
; )

; ; un-comment following line if constants are needed
; ;(:constants )

; (:predicates ;todo: define predicates here
; )


; (:functions ;todo: define numeric functions here
; )

; ;define actions here

; ; )
(define (domain hello_person)
    (:requirements :typing :negative-preconditions);necessary to remove warnings
    (:types person)
    (:predicates  
        (greeted ?x - person)
    )
    (:action hello
        :parameters (?x - person)
        :precondition (and (not (greeted ?x)))
        :effect (and (greeted ?x))
    )
)