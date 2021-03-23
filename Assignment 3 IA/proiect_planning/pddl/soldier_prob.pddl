(define (problem soldier1)
	(:domain soldier)
	(:objects
		s1 s2 s3 s4 s5 s6 - soldier
	)
	(:init
		(is-teama s1)
		(is-teama s2)
		(is-teama s3)
		(is-teamb s4)
		(is-teamb s5)
		(is-teamb s6)
		(is-full s1)
		(is-full s2)
		(is-full s3)
		(is-full s4)
		(is-full s5)
		(is-full s6)
		(three_b s1)
		(three_b s2)
		(three_b s3)
		(three_b s4)
		(three_b s5)
		(three_b s6)
		
	)
	(:goal
		(and
			(dead s4)
			(dead s5)
			(dead s6)
		)

	)
)
