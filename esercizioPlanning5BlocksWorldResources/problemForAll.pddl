(define (problem blocksWorldResourcesProblem) (:domain blocksWorldResourcesDomain)
    (:objects 
        a
        b
        c
        d
        e - block
        claw1 - claw
    )

    (:init
        ;todo: put the initial state's facts and numeric values here
        (onTable a)
        (onTable c)
        (onTable d)
        (onTop b a)
        (onTop e d)
        (clear b)
        (clear c)
        (clear e)
        (= (batteryLevel claw1) 3)
        ;(not (grasping))

    )

    (:goal (and
        ;todo: put the goal condition here
        (onTop a c)
        (onTop b a)
        (onTop e d)
        (onTable c)
        (onTable d)
        (clear b)
        (clear e)
        (forall (?b - block) (not (grasping claw1 ?b)))

    ))

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)

