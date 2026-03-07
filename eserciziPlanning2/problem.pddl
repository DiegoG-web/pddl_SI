; (define (problem problem_name) (:domain domain_name)
; (:objects 
; )

; (:init
;     ;todo: put the initial state's facts and numeric values here
; )

; (:goal (and
;     ;todo: put the goal condition here
; ))

; ;un-comment the following line if metric is needed
; ;(:metric minimize (???))
; )
(define (problem instance_2) (:domain hello_person)
    (:objects 
        enrico alessandro arcimbolfo - person
    )
    (:init
        ;Nothing is true at the beginning
    )
    (:goal (and
        (forall (?x - person) (greeted ?x))
    ))
)
