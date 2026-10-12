data modify storage ssm: w.data.item set from storage ssm: w.data.input_copy[0]

execute if data storage ssm: w.data.item{} run scoreboard players add $ssm ssm_length 1
execute store result score $ssm ssm_item_length run data get storage ssm: w.data.item
execute unless data storage ssm: w.data.item{} run scoreboard players operation $ssm ssm_length += $ssm ssm_item_length

data remove storage ssm: w.data.input_copy[0]
execute if data storage ssm: w.data.input_copy[0] run function ssm:parts/length/each