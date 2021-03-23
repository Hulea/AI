(define (domain soldier)
	(:requirements :strips :typing :negative-preconditions)
	(:types soldier)

	(:predicates
		(is-full ?s - soldier)
		;(is-threeq ?s - soldier)
		(is-half ?s - soldier)
		(is-oneq ?s - soldier)
		(is-zero ?s - soldier)
		(dead ?s - soldier)
		(hit ?s - soldier)
		(is-teama ?s - soldier)
		(is-teamb ?s - soldier)
		(three_b ?s - soldier)
		(two_b ?s - soldier)
		(one_b ?s - soldier)
		(zero_b ?s - soldier)
		(retake ?s1 - soldier)
		(rem_bul ?s1 - soldier)
	)

	(:action shoot
		:parameters(?s1 ?s2 - soldier)
		:precondition(and
			(or
				(three_b ?s1)
				(two_b ?s1)
				(one_b ?s1)
			)
			(or 
				(and
					(is-teama ?s1)
					(is-teamb ?s2)
				)
				(and
					(is-teama ?s2)
					(is-teamb ?s1)
				)
			)
			(not (zero_b ?s1))
		)
		
		:effect(and
			(hit ?s2)
			(rem_bul ?s1)
			(when
				(and (three_b ?s1) (rem_bul ?s1))
				(and (two_b ?s1) (not (three_b ?s1)) (not (rem_bul ?s1)))
			)
			(when
				(and (two_b ?s1) (rem_bul ?s1))
				(and (one_b ?s1) (not (two_b ?s1)) (not (rem_bul ?s1)))
			)
			(when
				(and (one_b ?s1) (rem_bul ?s1))
				(and (zero_b ?s1) (not (one_b ?s1)) (rem_bul ?s1))
			)
			(retake ?s2)
		)
	)



	(:action take_damage
		:parameters (?s1 - soldier)
		:precondition(and
			(hit ?s1)
		)
		:effect(and
			
			(when 
				(and (is-full ?s1) (retake ?s1))
				(and (is-half ?s1) (not (hit ?s1)) (not (is-full ?s1)) (not (retake ?s1))) 
			)
			(when 
				(and (is-half ?s1) (retake ?s1))
				(and (is-oneq ?s1) (not (hit ?s1)) (not (is-half ?s1)) (not (retake ?s1)))
			)
			(when 
				(and (is-oneq ?s1) (retake ?s1))
				(and (is-zero ?s1) (not (hit ?s1)) (not (is-oneq ?s1)) (not (retake ?s1))) 
			)
		)

	)
	
	(:action die
		:parameters(?s1 - soldier)
		:precondition(and
			(is-zero ?s1)
		)
		:effect(and
			(dead ?s1)
		)
	)


)