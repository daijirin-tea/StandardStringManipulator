#> ssm:parts/slice/main
#
# StringPartsをstartからendまで切り取ります
#
# @input storage ssm: frames[-1].input: {parts:StringParts, start?:int, end?:int}
# @output storage ssm: frames[-1].output: {error:1b} | {error:0b,result:StringParts}

function ssm:set_frame_data
data modify storage ssm: w.data.input set from storage ssm: w.input

function ssm:save_frame
data modify storage ssm: temporary set from storage ssm: w
data modify storage ssm: w set value {}
data modify storage ssm: w.input set from storage ssm: temporary.data.input.parts
data modify storage ssm: frames append from storage ssm: w
function ssm:parts/length/main
data modify storage ssm: temporary set from storage ssm: w
data remove storage ssm: frames[-1]
function ssm:set_frame

execute store result score $ssm ssm_length run data get storage ssm: temporary.output

scoreboard players set $ssm ssm_start_index 0
scoreboard players operation $ssm ssm_end_index = $ssm ssm_length
execute if data storage ssm: w.data.input.start store result score $ssm ssm_start_index run data get storage ssm: w.data.input.start
execute if data storage ssm: w.data.input.end store result score $ssm ssm_end_index run data get storage ssm: w.data.input.end

execute if score $ssm ssm_start_index matches ..-1 run scoreboard players operation $ssm ssm_start_index += $ssm ssm_length
execute if score $ssm ssm_end_index matches ..-1 run scoreboard players operation $ssm ssm_end_index += $ssm ssm_length

execute if score $ssm ssm_start_index > $ssm ssm_end_index run data modify storage ssm: w.data.output set value {error:1b}
execute if score $ssm ssm_start_index > $ssm ssm_end_index run return run function ssm:parts/slice/return

execute if score $ssm ssm_start_index matches ..-1 run data modify storage ssm: w.data.output set value {error:1b}
execute if score $ssm ssm_start_index matches ..-1 run return run function ssm:parts/slice/return

execute if score $ssm ssm_end_index > $ssm ssm_length run data modify storage ssm: w.data.output set value {error:1b}
execute if score $ssm ssm_end_index > $ssm ssm_length run return run function ssm:parts/slice/return

data modify storage ssm: w.data.output set value {error:0b,result:[]}
data modify storage ssm: w.data.input_copy_parts set from storage ssm: w.data.input.parts
scoreboard players set $ssm ssm_index 0
execute if data storage ssm: w.data.input_copy_parts[0] run function ssm:parts/slice/each

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score