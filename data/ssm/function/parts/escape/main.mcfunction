#> ssm:parts/escape/main
#
# "と\をエスケープします
#
# @input storage ssm: frames[-1].input: StringParts
# @output storage ssm: frames[-1].output: StringParts

function ssm:set_frame_data
data modify storage ssm: w.data.input set from storage ssm: w.input

data modify storage ssm: w.data.input_copy set from storage ssm: w.data.input
data modify storage ssm: w.data.output set value []
execute if data storage ssm: w.data.input_copy[0] run function ssm:parts/escape/each

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score