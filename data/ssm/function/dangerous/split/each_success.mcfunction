$data modify storage ssm: $(id).output append from storage ssm: $(id).each_letter

$execute store result storage ssm: $(id).start_index int 1 run scoreboard players add $$(id) ssm_start_index 1
$execute store result storage ssm: $(id).end_index int 1 run scoreboard players add $$(id) ssm_end_index 1

$function ssm:dangerous/split/each with storage ssm: $(id)