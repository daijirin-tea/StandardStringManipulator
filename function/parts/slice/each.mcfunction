data modify storage ssm: w.data.item set from storage ssm: w.data.input_copy_parts[0]
execute store result score $ssm ssm_item_length run data get storage ssm: w.data.item
execute if data storage ssm: w.data.item{} run scoreboard players set $ssm ssm_item_length 1

scoreboard players set $ssm ssm_flag 0

execute if score $ssm ssm_index > $ssm ssm_end_index run return 1
execute if score $ssm ssm_index < $ssm ssm_start_index run scoreboard players set $ssm ssm_flag 1

scoreboard players operation $ssm ssm_index += $ssm ssm_item_length

execute if score $ssm ssm_index < $ssm ssm_start_index run data remove storage ssm: w.data.input_copy_parts[0]
execute if score $ssm ssm_index < $ssm ssm_start_index run return run execute if data storage ssm: w.data.input_copy_parts[0] run function ssm:parts/slice/each
execute if score $ssm ssm_index > $ssm ssm_end_index run scoreboard players set $ssm ssm_flag 2

execute if score $ssm ssm_flag matches 0 run data modify storage ssm: w.data.output.result append from storage ssm: w.data.item
execute if score $ssm ssm_flag matches 0 run data remove storage ssm: w.data.input_copy_parts[0]
execute if score $ssm ssm_flag matches 0 run return run execute if data storage ssm: w.data.input_copy_parts[0] run function ssm:parts/slice/each

execute if data storage ssm: w.data.item{} unless score $ssm ssm_flag matches 0 run data remove storage ssm: w.data.input_copy_parts[0]
execute if data storage ssm: w.data.item{} unless score $ssm ssm_flag matches 0 run return run execute if data storage ssm: w.data.input_copy_parts[0] run function ssm:parts/slice/each

execute store result storage ssm: w.data.start_index int 1 run scoreboard players get $ssm ssm_start_index
execute store result storage ssm: w.data.end_index int 1 run scoreboard players get $ssm ssm_end_index
execute store result storage ssm: w.data.item_length int 1 run data get storage ssm: w.data.item
execute store result storage ssm: w.data.index int 1 run scoreboard players get $ssm ssm_index
data modify storage ssm: w.data.start_index set compute default integer {type:"max",inputs:[0,{type:"sub",left:{type:"storage",path:"w.data.start_index",storage:"ssm:"},right:{type:"sub",left:{type:"storage",path:"w.data.index",storage:"ssm:"},right:{type:"storage",path:"w.data.item_length",storage:"ssm:"}}}]}
data modify storage ssm: w.data.end_index set compute default integer {type:"min",inputs:[{type:"storage",path:"w.data.item_length",storage:"ssm:"},{type:"sub",left:{type:"storage",path:"w.data.end_index",storage:"ssm:"},right:{type:"sub",left:{type:"storage",path:"w.data.index",storage:"ssm:"},right:{type:"storage",path:"w.data.item_length",storage:"ssm:"}}}]}
function ssm:parts/slice/append with storage ssm: w.data

data remove storage ssm: w.data.input_copy_parts[0]
execute if data storage ssm: w.data.input_copy_parts[0] run function ssm:parts/slice/each