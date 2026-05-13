$data modify storage ssm: $(id).letter_to_join set from storage ssm: $(id).each_letter

$function ssm:dangerous/to_safe/escape_process {id:$(id)}

$function ssm:dangerous/to_safe/join with storage ssm: $(id)

$execute store result storage ssm: $(id).start_index int 1 run scoreboard players add $$(id) ssm_start_index 1
$execute store result storage ssm: $(id).end_index int 1 run scoreboard players add $$(id) ssm_end_index 1

$function ssm:dangerous/to_safe/each with storage ssm: $(id)