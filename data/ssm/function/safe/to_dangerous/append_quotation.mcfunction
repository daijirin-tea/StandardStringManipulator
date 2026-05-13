$scoreboard players operation $$(id) ssm_join_count2 = $$(id) ssm_join_count
$data modify storage ssm: $(id).back_slash set value "\\"
$function ssm:safe/to_dangerous/append_quotation/double_back_slash with storage ssm: $(id)

$function ssm:safe/to_dangerous/append_quotation/append with storage ssm: $(id)