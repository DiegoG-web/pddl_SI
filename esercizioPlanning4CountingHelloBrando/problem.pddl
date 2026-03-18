(define (problem travelProblem) (:domain travelDomain)
    (:objects 
        a - person
        brando - person
        diego - person
    )

    (:init
    (= (greetednumber a) 0)
    (= (greetednumber brando) 0)
    (= (greetednumber diego) 0)
)

    (:goal 
        (and
            (forall (?x - person) (greeted ?x))
            (forall (?x - person) (<= (greetednumber ?x) 20))
            (forall (?x - person) (>= (greetednumber ?x) 10))
        )
    )

)
