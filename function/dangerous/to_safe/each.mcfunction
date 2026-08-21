data remove storage ssm: w.data.each_letter
$execute store success score $ssm ssm_success run data modify storage ssm: w.data.each_letter set string storage ssm: w.input $(start_index) $(end_index)

execute if score $ssm ssm_success matches 1 run function ssm:dangerous/to_safe/each_success