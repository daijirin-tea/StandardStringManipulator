data modify storage ssm: w.data.letter_to_join set from storage ssm: w.data.each_letter

function ssm:dangerous/to_safe/escape_process

function ssm:dangerous/to_safe/join with storage ssm: w.data

execute store result storage ssm: w.data.start_index int 1 run scoreboard players add $ssm ssm_start_index 1
execute store result storage ssm: w.data.end_index int 1 run scoreboard players add $ssm ssm_end_index 1

function ssm:dangerous/to_safe/each with storage ssm: w.data