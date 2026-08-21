# 空文字でなかったら
data modify storage ssm: w.data.element_copy set from storage ssm: w.data.element
execute store success score $ssm ssm_success2 run data modify storage ssm: w.data.element_copy set value ""

execute if score $ssm ssm_success2 matches 1 run data modify storage ssm: w.data.list_a append from storage ssm: w.data.element
execute if score $ssm ssm_success2 matches 1 run scoreboard players add $ssm ssm_length 1
execute if score $ssm ssm_success2 matches 1 run data modify storage ssm: w.data.element set value ""