data modify storage ssm: w.data.output append from storage ssm: w.data.each_letter

execute store result storage ssm: w.data.start_index int 1 run scoreboard players add $ssm ssm_start_index 1
execute store result storage ssm: w.data.end_index int 1 run scoreboard players add $ssm ssm_end_index 1

function ssm:dangerous/split/each with storage ssm: w.data