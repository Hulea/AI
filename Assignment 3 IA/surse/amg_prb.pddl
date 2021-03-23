(define (problem amg)
(:domain amongus)

(:objects 
        first_room 
        second_room 
        third_room 
        fourth_room 
        fifth_room 
        sixth_room 
        seventh_room 
        eighth_room 
        ninth_room 
        encrypted_data
        corrupted_data 
        safe_data 
        first_room_card
        third_room_card
        sixth_room_card
        second_room_card 
        seventh_room_card
        eighth_room_card 
        
)

(:init
(no_card)
(location first_room)
(location second_room)
(location third_room)
(location fourth_room)
(location fifth_room)
(location sixth_room)
(location seventh_room)
(location eighth_room)
(location ninth_room)

(adj_room first_room second_room)
(adj_room first_room fourth_room)

(adj_room second_room first_room)
(adj_room second_room third_room)
(adj_room second_room fifth_room)

(adj_room third_room sixth_room)
(adj_room third_room second_room)

(adj_room fourth_room first_room)
(adj_room fourth_room fifth_room)
(adj_room fourth_room seventh_room)

(adj_room fifth_room second_room)
(adj_room fifth_room fourth_room)
(adj_room fifth_room sixth_room)
(adj_room fifth_room eighth_room)

(adj_room sixth_room third_room)
(adj_room sixth_room ninth_room)
(adj_room sixth_room fifth_room)

(adj_room seventh_room fourth_room)
(adj_room seventh_room eighth_room)

(adj_room eighth_room fifth_room)
(adj_room eighth_room seventh_room)
(adj_room eighth_room ninth_room)

(adj_room ninth_room eighth_room)
(adj_room ninth_room sixth_room)

(data_type encrypted_data)
(data_type corrupted_data)
(data_type safe_data)


(no_task_at first_room)
(no_task_at second_room)
(task_at third_room)
(no_task_at fourth_room)
(no_task_at fifth_room)
(task_at sixth_room)
(no_task_at seventh_room)
(task_at eighth_room)
(no_task_at ninth_room)


(unknown (task_data_type third_room encrypted_data))
(unknown (task_data_type third_room corrupted_data))
(unknown (task_data_type third_room safe_data))
(oneof
(task_data_type third_room encrypted_data)
(task_data_type third_room corrupted_data)
(task_data_type third_room safe_data)
)

(unknown (task_data_type sixth_room encrypted_data))
(unknown (task_data_type sixth_room corrupted_data))
(unknown (task_data_type sixth_room safe_data))
(oneof
(task_data_type sixth_room encrypted_data)
(task_data_type sixth_room corrupted_data)
(task_data_type sixth_room safe_data)
)

(unknown (task_data_type eighth_room encrypted_data))
(unknown (task_data_type eighth_room corrupted_data))
(unknown (task_data_type eighth_room safe_data))
(oneof
(task_data_type eighth_room encrypted_data)
(task_data_type eighth_room corrupted_data)
(task_data_type eighth_room safe_data)
)

(mem_card first_room_card)
(mem_card_type first_room_card encrypted_data)
(mem_card second_room_card)
(mem_card_type second_room_card safe_data)
(mem_card seventh_room_card)
(mem_card_type seventh_room_card corrupted_data)

(card_at first_room_card first_room)
(card_at second_room_card second_room)
(card_at seventh_room_card seventh_room)

(player_location first_room)

)

(:goal
(and
; (card_at first_room_card eighth_room)
; (card_at seventh_room_card sixth_room)
; (card_at second_room_card third_room)
(card_at first_room_card second_room)
(card_at seventh_room_card fourth_room)
(card_at second_room_card first_room)
)
)
)


