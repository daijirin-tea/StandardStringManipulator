#> ssm:string/quote/main
#
# 先頭と末尾に"を付け、中の"と\をエスケープします
#
# @input storage ssm: frames[-1].input: string
# @output storage ssm: frames[-1].output: string

function ssm:set_frame_data
data modify storage ssm: w.data.input set from storage ssm: w.input

function ssm:save_frame
data modify storage ssm: temporary set from storage ssm: w
data modify storage ssm: w set value {}
data modify storage ssm: w.input set from storage ssm: temporary.data.input
data modify storage ssm: frames append from storage ssm: w
function ssm:parts/parse/main
data remove storage ssm: frames[-1]
data modify storage ssm: temporary set from storage ssm: w
function ssm:set_frame

data modify storage ssm: w.data.input_parts set from storage ssm: temporary.output

function ssm:save_frame
data modify storage ssm: temporary set from storage ssm: w
data modify storage ssm: w set value {}
data modify storage ssm: w.input set from storage ssm: temporary.data.input_parts
data modify storage ssm: frames append from storage ssm: w
function ssm:parts/quote/main
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