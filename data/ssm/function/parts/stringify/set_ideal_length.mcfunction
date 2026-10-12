scoreboard players operation $ssm ssm_ideal_length += $ssm ssm_ideal_length
scoreboard players add $ssm ssm_join_count 1

execute if score $ssm ssm_ideal_length < $ssm ssm_length run function ssm:parts/stringify/set_ideal_length