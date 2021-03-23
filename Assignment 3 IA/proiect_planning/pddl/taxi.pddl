(define (domain crazy_taxi)
  (:requirements :strips :typing :conditional-effects)
  (:types taxi client locatie combustibil)


(:predicates
     (afara ?client1 - client)
     (urcat ?client1 - client ?crazy_taxi - taxi)

     (link ?locatie1 - locatie ?locatie2 - locatie)
     (locatie_taxi ?crazy_taxi - taxi ?locatie1 - locatie)
     (locatie_client ?client1 - client ?locatie1 - locatie)

     (combustibil_curent ?crazy_taxi - taxi ?combustibil_curent - combustibil)
     (consum ?combustibil_curent - combustibil ?combustibil_adaugat - combustibil)
     (umplere ?combustibil_curent - combustibil ?combustibil_adaugat - combustibil)
)


(:action inceput_cursa
     :parameters ( ?taxi - taxi ?locatie - locatie ?client - client)
     :precondition (and 
          (locatie_taxi ?taxi ?locatie)
          (afara ?client)
          (locatie_client ?client ?locatie)
     )
     :effect (and 
          (not (afara ?client))
          (urcat ?client ?taxi)
     )
)    

(:action sfarsit_cursa
     :parameters ( ?taxi - taxi ?locatie - locatie ?client - client)
     :precondition (and 
          (locatie_taxi ?taxi ?locatie)
          (urcat ?client ?taxi)
          (locatie_client ?client ?locatie)
     )
     :effect (and 
          (not (urcat ?client ?taxi))
          (afara ?client)
     )
)


(:action umplere_rezervor
     :parameters ( ?taxi - taxi ?start - locatie ?combustibil_initial - combustibil ?combustibil_dupa_plin - combustibil)
     :precondition (and 
          (locatie_taxi ?taxi ?start)
          (combustibil_curent ?taxi ?combustibil_initial)
          (umplere ?combustibil_initial ?combustibil_dupa_plin)
     )
     :effect (and 
          (not (combustibil_curent ?taxi ?combustibil_initial))
          (combustibil_curent ?taxi ?combustibil_dupa_plin)
     )
)

(:action move
     :parameters ( ?taxi - taxi ?start - locatie ?combustibil_initial - combustibil ?destinatie - locatie ?combustibil_dupa_plin - combustibil)
     :precondition (and 
          (locatie_taxi ?taxi ?start)
          (combustibil_curent ?taxi ?combustibil_initial)
          (link ?start ?destinatie)
          (consum ?combustibil_initial ?combustibil_dupa_plin)
     )
     :effect (and 
          (not (locatie_taxi ?taxi ?start))
          (not (combustibil_curent ?taxi ?combustibil_initial))
          (locatie_taxi ?taxi ?destinatie)
          (combustibil_curent ?taxi ?combustibil_dupa_plin)
          (forall (?client - client)
          (when (and
               (urcat ?client ?taxi)
               (locatie_client ?client ?start)
               (link ?start ?destinatie)
          )
          (and
               (not (locatie_client ?client ?start))
               (locatie_client ?client ?destinatie)
          )))
     )
)

)
