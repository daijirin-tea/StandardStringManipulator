data remove storage ssm: w.data.letter
execute store success score $ssm ssm_success run data modify storage ssm: w.data.letter set string storage ssm: w.data.input_copy 0 1
execute if score $ssm ssm_success matches 0 run return 1
data modify storage ssm: w.data.input_copy set string storage ssm: w.data.input_copy 1
scoreboard players add $ssm ssm_end_index 1

execute unless data storage ssm: w.data{letter:"\\"} unless data storage ssm: w.data{letter:"\""} run return run function ssm:parts/parse/each

execute store result storage ssm: w.data.start_index int 1 run scoreboard players get $ssm ssm_start_index
execute store result storage ssm: w.data.end_index int 1 run scoreboard players get $ssm ssm_end_index
execute unless score $ssm ssm_end_index = $ssm ssm_start_index run function ssm:parts/parse/append with storage ssm: w.data
scoreboard players add $ssm ssm_start_index 1
execute if data storage ssm: w.data{letter:"\\"} run data modify storage ssm: w.data.output append value {type:"backslash"}
execute if data storage ssm: w.data{letter:"\""} run data modify storage ssm: w.data.output append value {type:"double_quotation"}
function ssm:parts/parse/each