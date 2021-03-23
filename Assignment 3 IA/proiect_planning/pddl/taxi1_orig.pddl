

;;Layoutul pentru primul exemplu

;%%%%%%%%%%%%%%%
;%.    %%%%%%% %
;%     %    .% %
;%     % %%% % %
;%     % %%% % %
;% %%%%% %%% % %
;% %         % %
;% % %%% %%%%% %
;% %o%%%P%     %
;% % %%% %     % 		
;% %  o .%     %
;% %%%%%%%     %		
;%%%%%%%%%%%%%%%




(define (problem crazy_taxi)
   (:domain crazy_taxi)
   (:objects
         crazy_taxi - taxi
         strada_unu strada_doi strada_trei strada_patru strada_cinci strada_sase strada_sapte strada_opt intersectia_1 intersectia_2 intersectia_3 intersectia_4 intersectia_5 intersectia_6 intersectia_7 - locatie
         ion georghe nicu - client
         plin jumatate gol - combustibil
        )
    (:init
        (afara ion)
        (locatie_client ion intersectia_1)
        (afara georghe)
        (locatie_client georghe intersectia_2)
        (afara nicu)
        (locatie_client nicu intersectia_3)


        (locatie_taxi crazy_taxi strada_patru)
        (combustibil_curent crazy_taxi plin)
		
	(link intersectia_1 strada_unu)
	(link intersectia_1 strada_doi)
	(link strada_unu intersectia_1)
	(link strada_doi intersectia_1)
	
	(link intersectia_2 strada_trei)
	(link intersectia_2 strada_doi)
	(link strada_trei intersectia_2)
	(link strada_doi intersectia_2)
	
	(link strada_unu intersectia_6 )
	(link strada_opt intersectia_6 )
	
	(link intersectia_7 strada_opt)
	(link intersectia_7 strada_trei)
	(link intersectia_7 strada_sapte)
	(link intersectia_7 strada_patru)
	(link strada_opt intersectia_7 )
	(link strada_trei intersectia_7 )
	(link strada_sapte intersectia_7 )
	(link strada_patru intersectia_7 )
	
	(link intersectia_3 strada_patru)
	(link intersectia_3 strada_cinci)
	(link strada_patru intersectia_3)
	(link strada_cinci intersectia_3)
	
	(link intersectia_4 strada_sase)
	(link intersectia_4 strada_cinci)
	(link strada_sase intersectia_4)
	(link strada_cinci intersectia_4)
	
	(link intersectia_5 strada_sapte)
	(link intersectia_5 strada_sase)
	(link strada_sapte intersectia_5)
	(link strada_sase intersectia_5)
	
	
        (consum plin jumatate)
        (consum jumatate gol)
        (umplere gol plin)
    
        )
    (:goal
      (and
        (afara ion)
        (locatie_client ion strada_sase)
        (afara nicu)
        (locatie_client nicu strada_cinci)
       ))
)
