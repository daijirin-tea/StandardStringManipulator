$scoreboard players set $$(id) ssm_count 0

$execute if score $$(id) ssm_count matches 0 run data modify storage ssm: $(id).item_copy set from storage ssm: $(id).item
$execute if score $$(id) ssm_count matches 0 store success score $$(id) ssm_success run data modify storage ssm: $(id).item_copy set value "%22"
$execute if score $$(id) ssm_count matches 0 if score $$(id) ssm_success matches 0 run data modify storage ssm: $(id).replaced_list append value "%5c%22"
$execute if score $$(id) ssm_count matches 0 if score $$(id) ssm_success matches 0 run scoreboard players set $$(id) ssm_count 1

$execute if score $$(id) ssm_count matches 0 run data modify storage ssm: $(id).item_copy set from storage ssm: $(id).item
$execute if score $$(id) ssm_count matches 0 store success score $$(id) ssm_success run data modify storage ssm: $(id).item_copy set value "%5c"
$execute if score $$(id) ssm_count matches 0 if score $$(id) ssm_success matches 0 run data modify storage ssm: $(id).replaced_list append value "%5c%5c"
$execute if score $$(id) ssm_count matches 0 if score $$(id) ssm_success matches 0 run scoreboard players set $$(id) ssm_count 1

$execute if score $$(id) ssm_count matches 0 run data modify storage ssm: $(id).replaced_list append from storage ssm: $(id).item
$execute if score $$(id) ssm_count matches 0 run scoreboard players set $$(id) ssm_count 1

$function ssm:safe/quote/each {id:$(id)}