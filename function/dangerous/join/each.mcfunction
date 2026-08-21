data remove storage ssm: w.data.item
execute store success score $ssm ssm_success run data modify storage ssm: w.data.item set from storage ssm: w.data.input_copy[0]
data remove storage ssm: w.data.input_copy[0]

execute if score $ssm ssm_success matches 1 run function ssm:dangerous/join/each_success