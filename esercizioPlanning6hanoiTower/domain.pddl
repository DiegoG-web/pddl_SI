;Header and description

(define (domain hanoiDomain)

    ;remove requirements that are not needed
    (:requirements :typing :negative-preconditions :numeric-fluents)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle

        disk
        column

    )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (onTop ?d1 - disk ?d2 - disk)
        (on ?d - disk ?c - column)
        (clear ?d - disk)
        (columnEmpty ?c - column)

    )

    (:functions ;todo: define numeric functions here
            (size ?d - disk)
    )

    ;define actions here
    (:action moveToDiskFromDisk
        :parameters (?d1 - disk ?d2 - disk ?d3 - disk)
        :precondition (and (< (size ?d1) (size ?d2)) (clear ?d1) (clear ?d2) (onTop ?d1 ?d3))
        :effect (and (onTop ?d1 ?d2) (not (clear ?d2)) (not (onTop ?d1 ?d3)) (clear ?d3))
    )
    (:action moveToColumnFromDisk
        :parameters (?d1 - disk ?c - column ?d3 - disk)
        :precondition (and (columnEmpty ?c) (clear ?d1) (onTop ?d1 ?d3))
        :effect (and (not(columnEmpty ?c)) (on ?d1 ?c) (not (onTop ?d1 ?d3)) (clear ?d3))
    )
    (:action moveToDiskFromColumn
        :parameters (?d1 - disk ?d2 - disk ?c - column)
        :precondition (and (< (size ?d1) (size ?d2)) (clear ?d1) (clear ?d2) (on ?d1 ?c))
        :effect (and (onTop ?d1 ?d2) (not (clear ?d2)) (not (on ?d1 ?c)) (columnEmpty ?c))
    )
    (:action moveToColumnFromColumn
        :parameters (?d - disk ?c1 - column ?c2 - column)
        :precondition (and (columnEmpty ?c1) (clear ?d) (on ?d ?c2))
        :effect (and (not (columnEmpty ?c1)) (on ?d ?c1) (not (on ?d ?c2)) (columnEmpty ?c2))
    )
)