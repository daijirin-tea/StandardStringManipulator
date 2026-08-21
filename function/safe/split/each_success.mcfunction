data modify storage ssm: w.data.each_letter_copy set from storage ssm: w.data.each_letter
execute store success score $ssm ssm_success run data modify storage ssm: w.data.each_letter_copy set value "%"

execute if score $ssm ssm_success matches 1 run data modify storage ssm: w.data.output append from storage ssm: w.data.each_letter
execute if score $ssm ssm_success matches 1 store result storage ssm: w.data.start_index int 1 run scoreboard players add $ssm ssm_start_index 1
execute if score $ssm ssm_success matches 1 store result storage ssm: w.data.end_index int 1 run scoreboard players add $ssm ssm_end_index 1
execute if score $ssm ssm_success matches 1 store result storage ssm: w.data.end_index2 int 1 run scoreboard players add $ssm ssm_end_index2 1

execute if score $ssm ssm_success matches 0 run data modify storage ssm: w.data.output append from storage ssm: w.data.each_letter2
execute if score $ssm ssm_success matches 0 store result storage ssm: w.data.start_index int 1 run scoreboard players add $ssm ssm_start_index 3
execute if score $ssm ssm_success matches 0 store result storage ssm: w.data.end_index int 1 run scoreboard players add $ssm ssm_end_index 3
execute if score $ssm ssm_success matches 0 store result storage ssm: w.data.end_index2 int 1 run scoreboard players add $ssm ssm_end_index2 3

function ssm:safe/split/each with storage ssm: w.data