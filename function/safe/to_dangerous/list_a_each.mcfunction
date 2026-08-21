data remove storage ssm: w.data.item
execute store success score $ssm ssm_success run data modify storage ssm: w.data.item set from storage ssm: w.data.list_a_copy[0]

execute if score $ssm ssm_success matches 1 run data remove storage ssm: w.data.list_a_copy[0]
execute if score $ssm ssm_success matches 1 run function ssm:safe/to_dangerous/list_a_each_success