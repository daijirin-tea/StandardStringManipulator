#> ssm:string/concat/main
#
# 文字列を結合します
#
# @input storage ssm: frames[-1].input: string[]
# @output storage ssm: frames[-1].output: string

function ssm:set_frame_data
data modify storage ssm: w.data.input set from storage ssm: w.input

data modify storage ssm: w.data.input_copy set from storage ssm: w.data.input
data modify storage ssm: w.data.parts_list set value []

execute if data storage ssm: w.data.input_copy[0] run function ssm:string/concat/each

function ssm:save_frame
data modify storage ssm: temporary set from storage ssm: w
data modify storage ssm: w set value {}
data modify storage ssm: w.input set from storage ssm: temporary.data.parts_list
data modify storage ssm: frames append from storage ssm: w
function ssm:parts/concat/main
data remove storage ssm: frames[-1]
data modify storage ssm: temporary set from storage ssm: w
function ssm:set_frame

data modify storage ssm: w.data.output_parts set from storage ssm: temporary.output

function ssm:save_frame
data modify storage ssm: temporary set from storage ssm: w
data modify storage ssm: w set value {}
data modify storage ssm: w.input set from storage ssm: temporary.data.output_parts
data modify storage ssm: frames append from storage ssm: w
function ssm:parts/stringify/main
data remove storage ssm: frames[-1]
data modify storage ssm: temporary set from storage ssm: w
function ssm:set_frame

data modify storage ssm: w.data.output set from storage ssm: temporary.output

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score