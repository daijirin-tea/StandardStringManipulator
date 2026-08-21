scoreboard players operation $ssm ssm_join_count2 = $ssm ssm_join_count
data modify storage ssm: w.data.back_slash set value "\\"
function ssm:safe/to_dangerous/append_back_slash/double_back_slash with storage ssm: w.data

data modify storage ssm: w.data.list_a append from storage ssm: w.data.back_slash