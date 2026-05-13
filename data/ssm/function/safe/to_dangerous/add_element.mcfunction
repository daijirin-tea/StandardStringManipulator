#空文字でなかったら
$data modify storage ssm: $(id).element_copy set from storage ssm: $(id).element
$execute store success score $$(id) ssm_success2 run data modify storage ssm: $(id).element_copy set value ""

$execute if score $$(id) ssm_success2 matches 1 run data modify storage ssm: $(id).list_a append from storage ssm: $(id).element
$execute if score $$(id) ssm_success2 matches 1 run scoreboard players add $$(id) ssm_length 1
$execute if score $$(id) ssm_success2 matches 1 run data modify storage ssm: $(id).element set value ""