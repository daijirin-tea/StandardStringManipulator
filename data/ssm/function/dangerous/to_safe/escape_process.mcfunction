data modify storage ssm: w.data.each_letter_copy set from storage ssm: w.data.each_letter
execute store success score $ssm ssm_success2 run data modify storage ssm: w.data.each_letter_copy set value "\""
execute if score $ssm ssm_success2 matches 0 run data modify storage ssm: w.data.letter_to_join set value "%22"

data modify storage ssm: w.data.each_letter_copy set from storage ssm: w.data.each_letter
execute store success score $ssm ssm_success2 run data modify storage ssm: w.data.each_letter_copy set value "\\"
execute if score $ssm ssm_success2 matches 0 run data modify storage ssm: w.data.letter_to_join set value "%5c"

data modify storage ssm: w.data.each_letter_copy set from storage ssm: w.data.each_letter
execute store success score $ssm ssm_success2 run data modify storage ssm: w.data.each_letter_copy set value "%"
execute if score $ssm ssm_success2 matches 0 run data modify storage ssm: w.data.letter_to_join set value "%25"