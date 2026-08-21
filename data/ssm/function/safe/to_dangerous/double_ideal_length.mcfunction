scoreboard players add $ssm ssm_join_count 1
execute store result storage ssm: w.data.ideal_length int 1 run scoreboard players operation $ssm ssm_ideal_length += $ssm ssm_ideal_length
function ssm:safe/to_dangerous/set_ideal_length with storage ssm: w.data