$data modify storage ssm: $(id).each_letter_copy set from storage ssm: $(id).each_letter
$execute store success score $$(id) ssm_success run data modify storage ssm: $(id).each_letter_copy set value "%"

$execute if score $$(id) ssm_success matches 1 run function ssm:safe/to_dangerous/one_letter with storage ssm: $(id)
$execute if score $$(id) ssm_success matches 1 store result storage ssm: $(id).start_index int 1 run scoreboard players add $$(id) ssm_start_index 1
$execute if score $$(id) ssm_success matches 1 store result storage ssm: $(id).end_index int 1 run scoreboard players add $$(id) ssm_end_index 1
$execute if score $$(id) ssm_success matches 1 store result storage ssm: $(id).end_index2 int 1 run scoreboard players add $$(id) ssm_end_index2 1

$execute if score $$(id) ssm_success matches 0 run function ssm:safe/to_dangerous/three_letters with storage ssm: $(id)
$execute if score $$(id) ssm_success matches 0 store result storage ssm: $(id).start_index int 1 run scoreboard players add $$(id) ssm_start_index 3
$execute if score $$(id) ssm_success matches 0 store result storage ssm: $(id).end_index int 1 run scoreboard players add $$(id) ssm_end_index 3
$execute if score $$(id) ssm_success matches 0 store result storage ssm: $(id).end_index2 int 1 run scoreboard players add $$(id) ssm_end_index2 3

$function ssm:safe/to_dangerous/each with storage ssm: $(id)