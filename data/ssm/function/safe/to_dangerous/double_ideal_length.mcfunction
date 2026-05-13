$scoreboard players add $$(id) ssm_join_count 1
$execute store result storage ssm: $(id).ideal_length int 1 run scoreboard players operation $$(id) ssm_ideal_length += $$(id) ssm_ideal_length
$function ssm:safe/to_dangerous/set_ideal_length with storage ssm: $(id)