$data modify storage ssm: w.data.output append string storage ssm: w.data.input $(start_index) $(end_index)

scoreboard players operation $ssm ssm_start_index = $ssm ssm_end_index