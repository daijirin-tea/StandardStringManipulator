data remove storage ssm: w.data.item
execute store success score $ssm ssm_success run data modify storage ssm: w.data.item set from storage ssm: w.data.split_list[0]
data remove storage ssm: w.data.split_list[0]

execute if score $ssm ssm_success matches 1 run function ssm:safe/quote/each_success