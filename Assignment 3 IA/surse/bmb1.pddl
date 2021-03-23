;  P . . . . . . . . . . 
;  . @ @ @ @ @ @ @ . . . 
;  . . . . . . . . @ B . 
;  . . @ @ @ @ . . . @ @ 
;  . . . @ B . @ . . . . 
;  . . . . . . . @ . . @ 
;  @ . @ @ . @ @ @ @ . . 
;  @ . @ @ . @ . @ @ . @ 
;  @ @ @ @ @ @ @ @ . . . 
;  . @ . . . @ . . . @ . 
;  G . . @ . . . @ . . . 

(define (problem prb)
  (:domain bmb)
  (:objects x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 
            y0 y1 y2 y3 y4 y5 y6 y7 y8 y9 y10 - locatie 
            player - player)
  (:init
    (next x0 x1) 
    (next x1 x2)
    (next x2 x3) 
    (next x3 x4) 
    (next x4 x5) 
    (next x5 x6) 
    (next x6 x7) 
    (next x7 x8) 
    (next x8 x9) 
    (next x9 x10)
    (next y0 y1) 
    (next y1 y2) 
    (next y2 y3) 
    (next y3 y4) 
    (next y4 y5) 
    (next y5 y6) 
    (next y6 y7) 
    (next y7 y8) 
    (next y8 y9) 
    (next y9 y10)

    (prev x10 y9) 
    (prev x9 x8) 
    (prev x8 x7) 
    (prev x7 x6) 
    (prev x6 x5) 
    (prev x5 x4) 
    (prev x4 x3) 
    (prev x3 x2) 
    (prev x2 x1) 
    (prev x1 x0)
    (prev y10 y9) 
    (prev y9 y8) 
    (prev y8 y7) 
    (prev y7 y6) 
    (prev y6 y5) 
    (prev y5 y4) 
    (prev y4 y3) 
    (prev y3 y2) 
    (prev y2 y1) 
    (prev y1 y0)

    (perete x1 y1) 
    (perete x2 y1) 
    (perete x3 y1) 
    (perete x4 y1) 
    (perete x5 y1) 
    (perete x6 y1) 
    (perete x7 y8)
    (perete x7 y1)

    (perete x8 y2)

    (perete x1 y3) 
    (perete x3 y3) 
    (perete x4 y3) 
    (perete x5 y3) 
    (perete x9 y3)
    (perete x10 y3)

    (perete x2 y4)
    (perete x6 y4)

    (perete x7 y5)
    (perete x10 y5)

    (perete x0 y6) 
    (perete x1 y6) 
    (perete x3 y6) 
    (perete x4 y6) 
    (perete x7 y6) 
    (perete x8 y6) 

    (perete x8 y6)

    (perete x8 y7)
    (perete x10 y7)
    (perete x3 y7)
    (perete x4 y7)
    (perete x7 y7)
    (perete x0 y7)


    (perete x0 y8) 
    (perete x1 y8) 
    (perete x2 y8) 
    (perete x3 y8) 
    (perete x4 y8) 
    (perete x5 y8) 
    (perete x6 y8) 
    (perete x7 y8)
  
    (perete x1 y9)
    (perete x5 y9)
    (perete x9 y9)

    (perete x3 y10)
    (perete x7 y10)

    (bomba x4 y4)
    (bomba x9 y2)

    (locatie_curenta player x0 y0))

  (:goal
    (and
    (not (bomba x4 y4))
    (not (bomba x9 y2))
    (locatie_curenta player x0 y9)
        ))
    
  )
