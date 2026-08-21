# 2倍
$data modify storage ssm: w.data.back_slash set value "$(back_slash)$(back_slash)$(back_slash)$(back_slash)"
scoreboard players remove $ssm ssm_join_count2 1
execute if score $ssm ssm_join_count2 matches 1.. run function ssm:safe/to_dangerous/append_back_slash/double_back_slash with storage ssm: w.data