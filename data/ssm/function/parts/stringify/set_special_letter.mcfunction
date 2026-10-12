function ssm:parts/stringify/set_special_letter2 with storage ssm: w.data

scoreboard players remove $ssm ssm_join_count 1
execute if score $ssm ssm_join_count matches 1.. run return run function ssm:parts/stringify/set_special_letter

function ssm:parts/stringify/set_special_letter3 with storage ssm: w.data