#2倍 + 1
$data modify storage ssm: $(id).back_slash set value "$(back_slash)$(back_slash)$(back_slash)$(back_slash)\\"
$scoreboard players remove $$(id) ssm_join_count2 1
$execute if score $$(id) ssm_join_count2 matches 1.. run function ssm:safe/to_dangerous/append_quotation/double_back_slash with storage ssm: $(id)