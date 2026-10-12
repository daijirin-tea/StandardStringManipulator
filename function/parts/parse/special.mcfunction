data modify storage ssm: w.data.output set value []
scoreboard players set $ssm ssm_start_index 0
scoreboard players set $ssm ssm_end_index -1
data modify storage ssm: w.data.input_copy set from storage ssm: w.data.input
function ssm:parts/parse/each

scoreboard players add $ssm ssm_end_index 1
execute store result storage ssm: w.data.start_index int 1 run scoreboard players get $ssm ssm_start_index
execute store result storage ssm: w.data.end_index int 1 run scoreboard players get $ssm ssm_end_index
execute unless score $ssm ssm_end_index = $ssm ssm_start_index run function ssm:parts/parse/append with storage ssm: w.data

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score