$data modify storage ssm: $(id).each_letter_copy set from storage ssm: $(id).each_letter
$execute store success score $$(id) ssm_success2 run data modify storage ssm: $(id).each_letter_copy set value "\""
$execute if score $$(id) ssm_success2 matches 0 run data modify storage ssm: $(id).letter_to_join set value "%22"

$data modify storage ssm: $(id).each_letter_copy set from storage ssm: $(id).each_letter
$execute store success score $$(id) ssm_success2 run data modify storage ssm: $(id).each_letter_copy set value "\\"
$execute if score $$(id) ssm_success2 matches 0 run data modify storage ssm: $(id).letter_to_join set value "%5c"

$data modify storage ssm: $(id).each_letter_copy set from storage ssm: $(id).each_letter
$execute store success score $$(id) ssm_success2 run data modify storage ssm: $(id).each_letter_copy set value "%"
$execute if score $$(id) ssm_success2 matches 0 run data modify storage ssm: $(id).letter_to_join set value "%25"