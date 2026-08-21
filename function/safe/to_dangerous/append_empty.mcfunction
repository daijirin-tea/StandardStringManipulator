data modify storage ssm: w.data.list_a append value ""
scoreboard players remove $ssm ssm_count 1
execute if score $ssm ssm_count matches 1.. run function ssm:safe/to_dangerous/append_empty