execute store result storage ssm: w.scores[{objectives:"ssm_start_index"}].value int 1 run scoreboard players get $ssm ssm_start_index
execute store result storage ssm: w.scores[{objectives:"ssm_end_index"}].value int 1 run scoreboard players get $ssm ssm_end_index
execute store result storage ssm: w.scores[{objectives:"ssm_end_index2"}].value int 1 run scoreboard players get $ssm ssm_end_index2
execute store result storage ssm: w.scores[{objectives:"ssm_success"}].value int 1 run scoreboard players get $ssm ssm_success
execute store result storage ssm: w.scores[{objectives:"ssm_success2"}].value int 1 run scoreboard players get $ssm ssm_success2
execute store result storage ssm: w.scores[{objectives:"ssm_length"}].value int 1 run scoreboard players get $ssm ssm_length
execute store result storage ssm: w.scores[{objectives:"ssm_ideal_length"}].value int 1 run scoreboard players get $ssm ssm_ideal_length
execute store result storage ssm: w.scores[{objectives:"ssm_count"}].value int 1 run scoreboard players get $ssm ssm_count
execute store result storage ssm: w.scores[{objectives:"ssm_join_count"}].value int 1 run scoreboard players get $ssm ssm_join_count
execute store result storage ssm: w.scores[{objectives:"ssm_join_count2"}].value int 1 run scoreboard players get $ssm ssm_join_count2

data remove storage ssm: frames[-1]
data modify storage ssm: frames append from storage ssm: w