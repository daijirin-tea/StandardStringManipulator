#> ssm:parts/unquote/main
#
# quoteの逆の操作です
#
# @input storage ssm: frames[-1].input: StringParts
# @output storage ssm: frames[-1].output: {error:1b} | {error:0b,result:StringParts}

function ssm:set_frame_data
data modify storage ssm: w.data.input set from storage ssm: w.input

data modify storage ssm: w.data.input_copy set from storage ssm: w.data.input

data modify storage ssm: w.data.item set from storage ssm: w.data.input_copy[0]
execute unless data storage ssm: w.data.item{type:"double_quotation"} run return run function ssm:parts/unquote/return_fail
data modify storage ssm: w.data.item set from storage ssm: w.data.input_copy[-1]
execute unless data storage ssm: w.data.item{type:"double_quotation"} run return run function ssm:parts/unquote/return_fail
data remove storage ssm: w.data.input_copy[0]
data remove storage ssm: w.data.input_copy[-1]

data modify storage ssm: w.data.output set value {error:0b,result:[]}
execute if data storage ssm: w.data.input_copy[0] run function ssm:parts/unquote/each

data modify storage ssm: w.output set from storage ssm: w.data.output
function ssm:save_frame_data
function ssm:reset_score