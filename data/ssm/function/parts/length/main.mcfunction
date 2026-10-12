#> ssm:parts/length/main
#
# StringPartsの文字列としての長さを取得します
#
# @input storage ssm: frames[-1].input: StringParts
# @output storage ssm: frames[-1].output: int

function ssm:set_frame_data
data modify storage ssm: w.data.input set from storage ssm: w.input

data modify storage ssm: w.data.input_copy set from storage ssm: w.data.input
scoreboard players set $ssm ssm_length 0

execute if data storage ssm: w.data.input_copy[0] run function ssm:parts/length/each

execute store result storage ssm: w.data.output int 1 run scoreboard players get $ssm ssm_length

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score