$data remove storage ssm: $(id).left
$execute store success score $$(id) ssm_success run data modify storage ssm: $(id).left set from storage ssm: $(id).list_a_copy[0]
$data modify storage ssm: $(id).right set from storage ssm: $(id).list_a_copy[1]

$execute if score $$(id) ssm_success matches 1 run data remove storage ssm: $(id).list_a_copy[0]
$execute if score $$(id) ssm_success matches 1 run data remove storage ssm: $(id).list_a_copy[0]
$execute if score $$(id) ssm_success matches 1 run function ssm:safe/to_dangerous/list_a_join_success with storage ssm: $(id)