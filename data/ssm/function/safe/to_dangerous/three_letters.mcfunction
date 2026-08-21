function ssm:safe/to_dangerous/add_element

data modify storage ssm: w.data.each_letter2_copy set from storage ssm: w.data.each_letter2
execute store success score $ssm ssm_success2 run data modify storage ssm: w.data.each_letter2_copy set value "%22"
execute if score $ssm ssm_success2 matches 0 run data modify storage ssm: w.data.list_a append value "\""
execute if score $ssm ssm_success2 matches 0 run scoreboard players add $ssm ssm_length 1

data modify storage ssm: w.data.each_letter2_copy set from storage ssm: w.data.each_letter2
execute store success score $ssm ssm_success2 run data modify storage ssm: w.data.each_letter2_copy set value "%5c"
execute if score $ssm ssm_success2 matches 0 run data modify storage ssm: w.data.list_a append value "\\"
execute if score $ssm ssm_success2 matches 0 run scoreboard players add $ssm ssm_length 1

data modify storage ssm: w.data.each_letter2_copy set from storage ssm: w.data.each_letter2
execute store success score $ssm ssm_success2 run data modify storage ssm: w.data.each_letter2_copy set value "%25"
execute if score $ssm ssm_success2 matches 0 run data modify storage ssm: w.data.list_a append value "%"
execute if score $ssm ssm_success2 matches 0 run scoreboard players add $ssm ssm_length 1