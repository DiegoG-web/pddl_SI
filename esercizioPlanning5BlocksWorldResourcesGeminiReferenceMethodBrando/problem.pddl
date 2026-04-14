(define (problem blocksworld-resources-prob1)
    
    ; Link this problem to our domain
    (:domain blocksworld-resources)
    
    ; Declare all the specific blocks in this scenario
    (:objects 
        a b c d e - block
        robby - arm
    )
    
    ; Setup the starting configuration
    (:init 
        ; Stack 1: b is on a, a is on the table
        (ontable a) 
        (on b a) 
        (clear b)
        
        ; Stack 2: c is alone on the table
        (ontable c) 
        (clear c)
        
        ; Stack 3: e is on d, d is on the table
        (ontable d) 
        (on e d) 
        (clear e)
        
        ; The arm state
        (handempty robby)
        
        ; Initialize the battery to 3 as requested
        (= (battery-level robby) 3)
    )
    
    ; Define the conditions that must be true to win
    (:goal (and
        ; We want b on a, and a on c. (c is on the table)
        (ontable c) 
        (on a c) 
        (on b a)
        
        ; We want e to remain on d. (d is on the table)
        (ontable d) 
        (on e d)
        
        ; Note: We don't strictly need to declare (clear b) or (clear e) 
        ; in the goal unless the prompt forces us to. The planner will 
        ; naturally leave them clear if nothing else goes on top of them.
    ))
)