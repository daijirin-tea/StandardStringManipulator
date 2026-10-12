data modify storage ssm: w.data.item_parts set value []
scoreboard players set $ssm ssm_success 0
function ssm:parts/normalize/item_check with storage ssm: w.data
execute if score $ssm ssm_success matches 0 run return run function ssm:parts/normalize/item_special
execute store success score $ssm ssm_success run data modify storage ssm: w.data.assigned_item set from storage ssm: w.data.item
execute if score $ssm ssm_success matches 1 run return run function ssm:parts/normalize/item_special
execute unless data storage ssm: w.data{item:""} run data modify storage ssm: w.data.item_parts append from storage ssm: w.data.item