$data remove storage ssm: $(id).item
$execute store success score $$(id) ssm_success run data modify storage ssm: $(id).item set from storage ssm: $(id).split_list[0]
$data remove storage ssm: $(id).split_list[0]

$execute if score $$(id) ssm_success matches 1 run function ssm:dangerous/quote/each_success {id:$(id)}