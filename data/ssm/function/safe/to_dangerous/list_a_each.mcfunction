$data remove storage ssm: $(id).item
$execute store success score $$(id) ssm_success run data modify storage ssm: $(id).item set from storage ssm: $(id).list_a_copy[0]

$execute if score $$(id) ssm_success matches 1 run data remove storage ssm: $(id).list_a_copy[0]
$execute if score $$(id) ssm_success matches 1 run function ssm:safe/to_dangerous/list_a_each_success {id:$(id)}