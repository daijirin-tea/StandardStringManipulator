data modify storage ssm: w.data.input_copy append value ""

scoreboard players remove $ssm ssm_ideal_length 1
execute if score $ssm ssm_ideal_length > $ssm ssm_length run function ssm:parts/stringify/append_empty