scoreboard players set $ssm ssm_count 0

execute if score $ssm ssm_count matches 0 run data modify storage ssm: w.data.item_copy set from storage ssm: w.data.item
execute if score $ssm ssm_count matches 0 store result score $ssm ssm_success run data modify storage ssm: w.data.item_copy set value "\""
execute if score $ssm ssm_count matches 0 if score $ssm ssm_success matches 0 run function ssm:safe/to_dangerous/append_quotation
execute if score $ssm ssm_count matches 0 if score $ssm ssm_success matches 0 run scoreboard players set $ssm ssm_count 1

execute if score $ssm ssm_count matches 0 run data modify storage ssm: w.data.item_copy set from storage ssm: w.data.item
execute if score $ssm ssm_count matches 0 store result score $ssm ssm_success run data modify storage ssm: w.data.item_copy set value "\\"
execute if score $ssm ssm_count matches 0 if score $ssm ssm_success matches 0 run function ssm:safe/to_dangerous/append_back_slash
execute if score $ssm ssm_count matches 0 if score $ssm ssm_success matches 0 run scoreboard players set $ssm ssm_count 1

execute if score $ssm ssm_count matches 0 run function ssm:safe/to_dangerous/append_normal
execute if score $ssm ssm_count matches 0 run scoreboard players set $ssm ssm_count 1

function ssm:safe/to_dangerous/list_a_each