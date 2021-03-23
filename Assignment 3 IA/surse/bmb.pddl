(define (domain bmb)
  (:types player locatie)
  (:predicates 
    (next ?a ?b - locatie)
    (prev ?a ?b - locatie)
    (locatie_curenta ?a - player ?x ?y - locatie)
    (perete ?x ?y)
    (bomba ?x ?y - locatie)
  )
   
  (:action dezamorseaza 
      :parameters
                  (?poz - player
                  ?x1 ?y1 - locatie)
      :precondition 
                  (and
                  (bomba ?x1 ?y1)
                  (locatie_curenta ?poz ?x1 ?y1)
                  )
      :effect (and 
          (not (bomba ?x1 ?y1))
      )
  )
  
   (:action 
    sus
    :parameters (?omf - player ?x1 ?y1 ?y2 - locatie)
    :precondition (and
        (locatie_curenta ?omf ?x1 ?y1)
        (prev ?y1 ?y2)
        (not (perete ?x1 ?y2)) 
    )
    :effect (and
        (not (locatie_curenta ?omf ?x1 ?y1))
        (locatie_curenta ?omf ?x1 ?y2)
    )
   )

  (:action 
    jos
     :parameters (?omf - player ?x1 ?y1 ?y2 - locatie)
    :precondition (and
        (locatie_curenta ?omf ?x1 ?y1)
        (next ?y1 ?y2)
        (not (perete ?x1 ?y2)) 
    )
    :effect (and
        (not (locatie_curenta ?omf ?x1 ?y1))
        (locatie_curenta ?omf ?x1 ?y2)
    )
   )


  (:action 
    dreapta
    :parameters (?omf - player ?x1 ?y1 ?x2 - locatie)
    :precondition (and
        (locatie_curenta ?omf ?x1 ?y1)
        (next ?x1 ?x2)
        (not (perete ?x2 ?y1) )
    )
    :effect (and
        (not (locatie_curenta ?omf ?x1 ?y1))
        (locatie_curenta ?omf ?x2 ?y1)
    )
   )

  (:action 
    stanga
    :parameters (?omf - player ?x1 ?y1 ?x2 - locatie)
    :precondition (and
        (locatie_curenta ?omf ?x1 ?y1)
        (prev ?x1 ?x2)
        (not (perete ?x2 ?y1) )
    )
    :effect (and
        (not (locatie_curenta ?omf ?x1 ?y1))
        (locatie_curenta ?omf ?x2 ?y1)
    )
   )
)
