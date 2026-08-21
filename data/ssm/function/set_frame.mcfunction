data modify storage ssm: w set from storage ssm: frames[-1]

execute store result score $ssm ssm_start_index run data get storage ssm: w.scores[{objectives:"ssm_start_index"}].value
execute store result score $ssm ssm_end_index run data get storage ssm: w.scores[{objectives:"ssm_end_index"}].value
execute store result score $ssm ssm_end_index2 run data get storage ssm: w.scores[{objectives:"ssm_end_index2"}].value
execute store result score $ssm ssm_success run data get storage ssm: w.scores[{objectives:"ssm_success"}].value
execute store result score $ssm ssm_success2 run data get storage ssm: w.scores[{objectives:"ssm_success2"}].value
execute store result score $ssm ssm_length run data get storage ssm: w.scores[{objectives:"ssm_length"}].value
execute store result score $ssm ssm_ideal_length run data get storage ssm: w.scores[{objectives:"ssm_ideal_length"}].value
execute store result score $ssm ssm_count run data get storage ssm: w.scores[{objectives:"ssm_count"}].value
execute store result score $ssm ssm_join_count run data get storage ssm: w.scores[{objectives:"ssm_join_count"}].value
execute store result score $ssm ssm_join_count2 run data get storage ssm: w.scores[{objectives:"ssm_join_count2"}].value