(define (problem lift1)
   (:domain lift)
   (:objects
         lif - elevator
         andrei vlad dan - person
         unu doi trei patru cinci sase - floor
        )
    (:init
    	(outsidelift andrei)
    	(outsidelift vlad)
    	(outsidelift dan)
    	(on-floor andrei trei)
    	(on-floor vlad unu)
    	(on-floor dan doi)
    	(want-lift andrei doi)
    	(want-lift vlad cinci)
    	(want-lift dan sase)
    	(lift-floor lif unu)
    	(next-to unu doi)
    	(next-to doi trei)
    	(next-to trei patru)
    	(next-to patru cinci)
    	(next-to cinci sase)
    	(previous unu doi)
    	(previous doi trei)
    	(previous trei patru)
    	(previous patru cinci)
    	(previous cinci sase)
    )

    (:goal
    	(and
    		(on-floor andrei doi)
    		(on-floor vlad cinci)
    		(on-floor dan sase)

    	)
    )

 )