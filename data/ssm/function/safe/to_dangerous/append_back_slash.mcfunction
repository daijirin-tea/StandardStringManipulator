$scoreboard players operation $$(id) ssm_join_count2 = $$(id) ssm_join_count
$data modify storage ssm: $(id).back_slash set value "\\"
$function ssm:safe/to_dangerous/append_back_slash/double_back_slash with storage ssm: $(id)

$data modify storage ssm: $(id).list_a append from storage ssm: $(id).back_slash