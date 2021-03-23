(define (domain lift)

	;(:requirements :strips :equality :typing :conditional-effects)

	(:types  elevator person floor)

	(:predicates
		(outsidelift ?per - person)
		(insidelift ?per - person ?lif - elevator)
		(on-floor ?per - person ?fl - floor)
		(want-lift ?per - person ?where - floor)
		(lift-floor ?lif - elevator ?fl - floor)
		(next-to ?fl - floor ?flnext - floor)
		(previous ?flprev - floor ?fl - floor)
	)


	(:action get_in
		:parameters (?per - person ?lif - elevator ?fl - floor)
		:precondition (and
			(on-floor ?per ?fl)
			(lift-floor ?lif ?fl)
			;(want-lift ?per ?fl1)
			;(not (want-lift ?per ?fl))
			(outsidelift ?per)

		)
		:effect (and
			(not (on-floor ?per ?fl))
			(not (outsidelift ?per))
			(insidelift ?per ?lif)

		)

	)


	(:action get_out
		:parameters (?per - person ?lif - elevator ?fl - floor)
		:precondition (and
			(insidelift ?per ?lif)
			(want-lift ?per ?fl)
			(lift-floor ?lif ?fl)
		)
		:effect (and
			(on-floor ?per ?fl)
			(outsidelift ?per)
			(not (insidelift ?per ?lif))

		)

	)

	(:action move_up
		:parameters (?lif - elevator ?fl - floor ?fl1 - floor)
		:precondition (and
			(lift-floor ?lif ?fl)
			(next-to ?fl ?fl1)
		)

		:effect (and
			(not (lift-floor ?lif ?fl))
			(lift-floor ?lif ?fl1)
		)

	)
	
	(:action move_down
		:parameters (?lif - elevator ?fl1 - floor ?fl - floor)
		:precondition (and
			(lift-floor ?lif ?fl1)
			(previous ?fl ?fl1)
		)

		:effect (and
			(not (lift-floor ?lif ?fl1))
			(lift-floor ?lif ?fl)
		)

	)




)