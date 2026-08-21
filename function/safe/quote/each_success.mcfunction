scoreboard players set $ssm ssm_count 0

execute if score $ssm ssm_count matches 0 run data modify storage ssm: w.data.item_copy set from storage ssm: w.data.item
execute if score $ssm ssm_count matches 0 store success score $ssm ssm_success run data modify storage ssm: w.data.item_copy set value "%22"
execute if score $ssm ssm_count matches 0 if score $ssm ssm_success matches 0 run data modify storage ssm: w.data.replaced_list append value "%5c%22"
execute if score $ssm ssm_count matches 0 if score $ssm ssm_success matches 0 run scoreboard players set $ssm ssm_count 1

execute if score $ssm ssm_count matches 0 run data modify storage ssm: w.data.item_copy set from storage ssm: w.data.item
execute if score $ssm ssm_count matches 0 store success score $ssm ssm_success run data modify storage ssm: w.data.item_copy set value "%5c"
execute if score $ssm ssm_count matches 0 if score $ssm ssm_success matches 0 run data modify storage ssm: w.data.replaced_list append value "%5c%5c"
execute if score $ssm ssm_count matches 0 if score $ssm ssm_success matches 0 run scoreboard players set $ssm ssm_count 1

execute if score $ssm ssm_count matches 0 run data modify storage ssm: w.data.replaced_list append from storage ssm: w.data.item
execute if score $ssm ssm_count matches 0 run scoreboard players set $ssm ssm_count 1

function ssm:safe/quote/each