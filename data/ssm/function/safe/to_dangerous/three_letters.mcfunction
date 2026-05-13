$function ssm:safe/to_dangerous/add_element {id:$(id)}

$data modify storage ssm: $(id).each_letter2_copy set from storage ssm: $(id).each_letter2
$execute store success score $$(id) ssm_success2 run data modify storage ssm: $(id).each_letter2_copy set value "%22"
$execute if score $$(id) ssm_success2 matches 0 run data modify storage ssm: $(id).list_a append value "\""
$execute if score $$(id) ssm_success2 matches 0 run scoreboard players add $$(id) ssm_length 1

$data modify storage ssm: $(id).each_letter2_copy set from storage ssm: $(id).each_letter2
$execute store success score $$(id) ssm_success2 run data modify storage ssm: $(id).each_letter2_copy set value "%5c"
$execute if score $$(id) ssm_success2 matches 0 run data modify storage ssm: $(id).list_a append value "\\"
$execute if score $$(id) ssm_success2 matches 0 run scoreboard players add $$(id) ssm_length 1

$data modify storage ssm: $(id).each_letter2_copy set from storage ssm: $(id).each_letter2
$execute store success score $$(id) ssm_success2 run data modify storage ssm: $(id).each_letter2_copy set value "%25"
$execute if score $$(id) ssm_success2 matches 0 run data modify storage ssm: $(id).list_a append value "%"
$execute if score $$(id) ssm_success2 matches 0 run scoreboard players add $$(id) ssm_length 1