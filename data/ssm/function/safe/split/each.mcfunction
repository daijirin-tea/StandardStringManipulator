$data remove storage ssm: $(id).each_letter
$execute store success score $$(id) ssm_success run data modify storage ssm: $(id).each_letter set string storage ssm: $(id).input $(start_index) $(end_index)
$data modify storage ssm: $(id).each_letter2 set string storage ssm: $(id).input $(start_index) $(end_index2)

$execute if score $$(id) ssm_success matches 1 run function ssm:safe/split/each_success {id:$(id)}