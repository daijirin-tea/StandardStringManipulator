$data remove storage ssm: $(id).item
$execute store success score $$(id) ssm_success run data modify storage ssm: $(id).item set from storage ssm: $(id).input_copy[0]
$data remove storage ssm: $(id).input_copy[0]
$execute if score $$(id) ssm_success matches 1 run function ssm:safe/join/each_success with storage ssm: $(id)