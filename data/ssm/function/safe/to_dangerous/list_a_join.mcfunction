data remove storage ssm: w.data.left
execute store success score $ssm ssm_success run data modify storage ssm: w.data.left set from storage ssm: w.data.list_a_copy[0]
data modify storage ssm: w.data.right set from storage ssm: w.data.list_a_copy[1]

execute if score $ssm ssm_success matches 1 run data remove storage ssm: w.data.list_a_copy[0]
execute if score $ssm ssm_success matches 1 run data remove storage ssm: w.data.list_a_copy[0]
execute if score $ssm ssm_success matches 1 run function ssm:safe/to_dangerous/list_a_join_success with storage ssm: w.data