(define (domain amongus)

(:predicates 
            (task_at ?x)
            (no_task_at ?x)

            (task_data_type ?x ?d)

            (mem_card ?c)
            (data_type ?d)
            (mem_card_type ?c ?t)
            (using_mem_card ?k)

            (card_at ?p ?x )
            (no_card )

            (location ?p)
            (adj_room ?x ?y)
            (player_location ?x)
           )


(:action search_next_task
:parameters (?current_location ?next_location)
:precondition (and 
                  (location ?current_location) 
                  (location ?next_location)
                  (player_location ?current_location) 
                  (adj_room ?current_location ?next_location) 
                  (no_task_at ?next_location))
:effect (and (player_location ?next_location) 
            (not (player_location ?current_location))))



(:action sense_task
:parameters (?task_location ?data_type)
 :observe (task_data_type ?task_location ?data_type))


;  (:action sense_loc
;  :parameters (?current_location)
;  :observe (player_location ?current_location))

;   (:action sense_adj
;  :parameters (?current_location ?task_location)
;  :observe (adj_room ?current_location ?task_location))


(:action complete_task
:parameters (?current_location ?task_location ?mem_card1 ?data_type1)
:precondition (and 
                  (player_location ?current_location) 
                  (location ?current_location) 
                  (location ?task_location) 
                  (adj_room ?current_location ?task_location)
                  (mem_card ?mem_card1) 
                  (mem_card_type ?mem_card1 ?data_type1)
                  (using_mem_card ?mem_card1)
                  (data_type ?data_type1)
               )
:effect (and  (when (task_data_type ?task_location ?data_type1) 
                        (and (no_task_at ?task_location) 
                        (not (task_at ?task_location))))))

(:action download
:parameters (?current_location ?mem_card)
:precondition (and 
                  (location ?current_location) 
                  (player_location ?current_location) 

                  (mem_card ?mem_card) 
                  (card_at ?mem_card ?current_location) 
                  (no_card)
               )
               
:effect (and (not (card_at ?mem_card ?current_location))  
                  (using_mem_card ?mem_card)
                  (not (no_card ))))

(:action upload
:parameters (?current_location ?mem_card)
:precondition (and 
                  (location ?current_location) 
                  (mem_card ?mem_card) 
                  (player_location ?current_location) 
                  (using_mem_card ?mem_card))
:effect (and 
            (no_card) 
            (card_at ?mem_card ?current_location) 
            (not (using_mem_card ?mem_card))))




)
	
